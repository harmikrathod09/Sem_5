#include <stdio.h>
#include <time.h>
#define N 100000

void bubbleSort(int arr[], int n)
{
    int swap;
    for (int i = 0; i < N; i++)
    {
        swap = 0;
        for (int j = 0; j < N - i - 1; j++)
        {
            if (arr[j] > arr[j + 1])
            {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
                swap = 1;
            }
        }
        if (swap == 0)
        {
            printf("Array already sorted\n");
            break;
        }
    }
}

int readFile(const char *filename, int arr[], int n)
{
    FILE *f = fopen(filename, "r");
    if (!f)
    {
        printf("File not found\n");
        return 0;
    }

    for (int i = 0; i < n; i++)
        fscanf(f, "%d", &arr[i]);

    fclose(f);
    return 1;
}

// void printArray(int arr[]){
// for (int i = 0; i < 10; i++)
// {
//     printf("%d\n", arr[i]);
// }
// }

void main()
{
    int arr[N];
    clock_t start, end;
    double time_taken;
    if (readFile("../Arrays/best_case_100000.txt", arr, N))
    {
        start = clock();
        bubbleSort(arr, N);
        end = clock();
        time_taken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Best case of Element %d is %f\n", N, time_taken);
    }

    if (readFile("../Arrays/average_case_100000.txt", arr, N))
    {
        start = clock();
        bubbleSort(arr, N);
        end = clock();
        time_taken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Average case of Element %d is %f\n", N, time_taken);
    }

    if (readFile("../Arrays/worst_case_100000.txt", arr, N))
    {
        start = clock();
        bubbleSort(arr, N);
        end = clock();
        time_taken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Worst case of Element %d is %f\n", N, time_taken);
    }
}