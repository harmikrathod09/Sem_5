#include <stdio.h>
#include <time.h>
#define N 100000

void bubbleSort(int arr[], int n)
{
    int key;
    for (int i = 0; i < n; i++)
    {
        key = arr[i];
        int j = i - 1;

        while (j >= 0 && arr[j] > key)
        {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
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