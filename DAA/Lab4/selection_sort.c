#include <stdio.h>
#include <time.h>
#define N 100000

void selectionSort(int arr[], int n)
{
  for (int i = 0; i < n - 1; i++)
    {
        int min_idx = i;

        for (int j = i + 1; j < n; j++)
        {
            if (arr[j] < arr[min_idx])
            {
                min_idx = j;
            }

            int temp = arr[i];
            arr[i] = arr[min_idx];
            arr[min_idx] = temp;
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

void printArray(int arr[]){
for (int i = 0; i < 10; i++)
{
    printf("%d\n", arr[i]);
}
}

void main()
{
    int arr[N];
    clock_t start, end;
    double time_taken;
    if (readFile("../Arrays/best_case_100000.txt", arr, N))
    {
        start = clock();
        selectionSort(arr, N);
        end = clock();
        time_taken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Best case of Element %d is %f\n", N, time_taken);
    }

    if (readFile("../Arrays/average_case_100000.txt", arr, N))
    {
        start = clock();
        selectionSort(arr, N);
        end = clock();
        time_taken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Average case of Element %d is %f\n", N, time_taken);
    }

    if (readFile("../Arrays/worst_case_100000.txt", arr, N))
    {
        start = clock();
        selectionSort(arr, N);
        end = clock();
        time_taken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Worst case of Element %d is %f\n", N, time_taken);
    }
}