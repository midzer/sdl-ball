# Emscripten

## Compile

em++ main.cpp -c -I include/ -flto -O3

## Link

emcc *.o libGL.a libGLU.a -sFULL_ES2=1 -lGL -o index.html -sUSE_SDL=2 -sUSE_SDL_TTF=2 -sUSE_SDL_MIXER=2 -sUSE_SDL_IMAGE=2 -sSDL2_IMAGE_FORMATS='["jpg","png"]' -sSDL2_MIXER_FORMATS='["ogg"]' -sSTACK_SIZE=262144 -sASYNCIFY -sASYNCIFY_STACK_SIZE=81920 --preload-file themes/ -sINITIAL_MEMORY=128MB -sENVIRONMENT=web -Wl,-u,fileno -flto -O3 --closure 1
