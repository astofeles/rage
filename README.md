# rage
*R*eally? *A*nother languai*GE*?

## Goal
The main goal of RAGE is in its development, one it is used as part of a college computing science work to learn about compilers.

It also has as goal be an easy ditadic algorithm learning language, providing really usefull easy opetors and constructions as `<->` (swap operator), and `for i <- 1 until 10` and `do ... until`.

## Running
To build build the compiler, just use `make` and Makefile take care of the commands.

To use it, execute:

`./rage [FILE]`

If no file is given, or file is not found, then 'stdin' will be used.
Use `rage --help` to get general usage

## Organization
* Makefile: will be used to automate building the compiler, as soon as we understand what we are doing in this life
* the `include/` folder will be used to put every library header `.h` we may have to make when we go to that interesting part...
* the `src/` forlder will contain `include/*`'s respectives implementations
* root directory is going to contains respectives formal descriptions of the language.
