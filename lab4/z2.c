#include <stdio.h>

unsigned long long int GetTime();

int main(int argc, char const *argv[])
{
    char tab [1024][1024];
    char c;
    unsigned long long int start,stop;

    for(int i=0; i< 1024; i++){
    
        start = GetTime();
        for(int j=0; j<1024; j++){

            c = tab[j][i];
        }
        stop = GetTime();
        printf("i: %d cycles: %llu \n", i, stop - start);
    }

    printf("%c", c);
    return 0;
}
