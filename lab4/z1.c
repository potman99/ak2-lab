#include <stdio.h>

unsigned long long int GetTime();

int main(int argc, char const *argv[])
{
    char tab [4096][4096];
    //int var;
    char var1;

    unsigned long long int startRow,stopRow,startCol, stopCol;

    for(int i=0; i<4096; i++){
        for(int j=0; j<4096; j++){
            tab[i][j]=j;
        }
    }
    
    startRow = GetTime();

    for(int i=0; i<4096; i++){
        for(int j=0; j<4096; j++){
            //int var = tab[i][j];
            var1 = tab[i][j];
        }
    }

    stopRow = GetTime();

    printf("Diffrence row: %llu\n", stopRow-startRow);
    
    startCol = GetTime();

    for(int i=0; i<4096; i++){
        for(int j=0; j<4096; j++){
            //int var = tab[j][i];
            var1 = tab[j][i];
        }
    }

    stopCol = GetTime();

    printf("Diffrence col: %llu\n", stopCol-startCol);
    //printf("%c\n", var1);

    return 0;
}
