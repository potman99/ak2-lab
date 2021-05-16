#include <stdio.h>

unsigned long long int GetTime();
void AddNumbers();

int main(int argc, char const *argv[])
{

    unsigned long long int start,stop;

    start = GetTime();
    AddNumbers();
    stop = GetTime();
    printf("\n");
    printf("Cycles: %llu",stop-start);

    return 0;
}
