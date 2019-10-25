#include <stdio.h>
#include <stdlib.h>
#include "rage.h"

#ifdef _RAGE_H

/* implementation of the rage library */
void show_help() {
    char c;
    FILE * help = fopen("rage.help", "r");
    while (!feof(help)) {
        c = getc(help);
        if (c != EOF) putchar(c);
    }
}

#endif
