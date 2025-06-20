#include <stdio.h>
#include<stdlib.h>
#include<time.h>
#define SIZE 100000

void bestCase()
{
    FILE *f = fopen("best_case_100000.txt", "w");
    for (int i = 1; i <= SIZE; i++)
        fprintf(f, "%d\n", i);
    fclose(f);
}

void worstCase()
{
    FILE *f = fopen("worst_case_100000.txt", "w");
    for (int i = SIZE; i >= 1; i--)
        fprintf(f, "%d\n", i);
    fclose(f);
}

void averageCase()
{
    int arr[SIZE];
    for (int i = 1; i <= SIZE; i++)
        arr[i+1] = i;

    srand(time(NULL));
    for (int i = SIZE - 1; i > 0; i--)
    {
        int j = rand() % (i + 1);
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }

    FILE *f = fopen("average_case_100000.txt", "w");
    for (int i = 0; i < SIZE; i++)
        fprintf(f, "%d\n", arr[i]);
    fclose(f);
}

void main()
{
    bestCase();
    worstCase();
    averageCase();
}