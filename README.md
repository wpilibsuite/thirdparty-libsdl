# thirdparty-libsdl

This repo contains the build tools to build [libsdl](https://github.com/libsdl-org/SDL). 3 different versions are built. Shared and Static are built, with a shared CRT on Windows.
And then a SharedStaticCRT variant is built for standalone use on Windows.

### Building Instructions

`./gradlew build` will initiate the build for your platform. The built headers, sources, and libraries will be placed in `build/allOutputs`. Note that you **must** use a VS Developer Prompt on Windows.
