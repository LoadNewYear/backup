#include <cs50.h>
#include <stdio.h>

int main(void) {
    int x = 11;
    
    for (int i = 1; i < x + 1; i++) {

        int needed_dots = x - i;
        for (int j = 0; j < needed_dots; j++) {
            printf(" ");
        }
        for (int j = 0; j < i; j++) {
            printf("#");
        }
        printf("\n");
    }
}
