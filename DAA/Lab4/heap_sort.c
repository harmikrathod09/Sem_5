#include <stdio.h>
#include <time.h>
#define N 100000

void max_heapify(int arr[], int n, int i)
{
    int largest = i; 
    int left = 2 * i + 1; 
    int right = 2 * i + 2; 

    if (left < n && arr[left] > arr[largest])
        largest = left;

    if (right < n && arr[right] > arr[largest])
        largest = right;

    if (largest != i)
    {
        int temp = arr[i];
        arr[i] = arr[largest];
        arr[largest] = temp;

        max_heapify(arr, n, largest);
    }
}

void build_max_heap(int arr[], int n)
{
    for (int i = n / 2 - 1; i >= 0; i--)
    {
        max_heapify(arr, n, i);
    }
}

void heapSort(int arr[], int n)
{
    build_max_heap(arr, n);

    for (int i = n - 1; i >= 1; i--)
    {
        int temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;

        max_heapify(arr, i, 0);
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

void printArray(int arr[])
{
    for (int i = 0; i < 10; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

void main()
{
  int arr[N];
    clock_t start, end;
    double time_taken;
    if (readFile("../Arrays/best_case_100000.txt", arr, N))
    {
        start = clock();
        heapSort(arr, N);
        end = clock();
        time_taken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Best case of Element %d is %f\n", N, time_taken);
    }

    if (readFile("../Arrays/average_case_100000.txt", arr, N))
    {
        start = clock();
        heapSort(arr, N);
        end = clock();
        time_taken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Average case of Element %d is %f\n", N, time_taken);
    }

    if (readFile("../Arrays/worst_case_100000.txt", arr, N))
    {
        start = clock();
        heapSort(arr, N);
        end = clock();
        time_taken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Worst case of Element %d is %f\n", N, time_taken);
    }
}
