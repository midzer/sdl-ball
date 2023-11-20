ifndef PREFIX
	PREFIX=/usr/local/
endif

DESTDIR?=$(PREFIX)share/games/sdl-ball/

DATADIR?=themes/
BINDIR=bin/

#append -DWITH_WIIUSE to compile with WIIUSE support!
#append -DNOSOUND to compile WITHOUT sound support
STRIP=strip
CXX?=g++

CXXFLAGS+=-Wall -sUSE_SDL=2 -sUSE_SDL_IMAGE=2 -sUSE_SDL_TTF=2 -sUSE_SDL_MIXER=2 -I include/ -DDATADIR="\"$(DATADIR)\""

#append -lwiiuse to compile with WIIUSE support
#remove -lSDL_mixer if compiling with -DNOSOUND
LIBS+=-lGL -lGLU -sUSE_SDL=2 -sUSE_SDL_IMAGE=2 -sUSE_SDL_TTF=2 -sUSE_SDL_MIXER=2

SOURCES=main.cpp 
OBJECTS=$(SOURCES:.cpp=.o)

EXECUTABLE=sdl-ball

all: $(SOURCES) $(EXECUTABLE)
	
$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(LDFLAGS) $(OBJECTS) $(LIBS) -o $@
	$(STRIP) $@

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $< -o $@

clean:
	rm -f *.o sdl-ball

install: $(EXECUTABLE) install-bin install-data

install-bin:
	mkdir -p $(DESTDIR)
	cp $(EXECUTABLE) $(DESTDIR)
	ln -s $(DESTDIR)$(EXECUTABLE) $(PREFIX)$(BINDIR)

install-data:
	mkdir -p $(DESTDIR)$(DATADIR)
	cp -p -R themes/* $(DESTDIR)$(DATADIR)

remove:
	rm -R ~/.config/sdl-ball
	
