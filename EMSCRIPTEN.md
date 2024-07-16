# Emscripten

## Compile

emmake make

## Link

em++ -flto -O3 -fno-rtti -fno-exceptions *.o libGL.a libGLU.a -sFULL_ES2 -lGL -o index.html -sUSE_SDL=2
 -sUSE_SDL_TTF=2 -sUSE_SDL_MIXER=2 -sUSE_SDL_IMAGE=2 -sSDL2_IMAGE_FORMATS='["jpg","png"]' -sSDL2_MIXER_FORMATS='["ogg"]' -sSTACK_SIZE=262144 -sASYNCIFY -sASYNCIFY_IGNORE_INDIRECT -sASYNCIFY_ONLY=@funcs.txt -sENVIRONMENT=web -sASYNCIFY_STACK_SIZE=81920 --preload-file themes/ -sINITIAL_MEMORY=64MB -Wl,-u,fileno --closure 1
 