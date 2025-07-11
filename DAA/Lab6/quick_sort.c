#include <stdio.h>
#include <time.h>
#define N 100000

void swap(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int partition(int arr[], int low, int high) {
    int pivot = arr[low];
    int left = low + 1;
    int right = high;

    while (1) {
        while (left <= right && arr[left] <= pivot)
            left++;
        while (left <= right && arr[right] > pivot)
            right--;
        if (left > right)
            break;
        swap(&arr[left], &arr[right]);
    }

    swap(&arr[low], &arr[right]);
    return right;
}

void quickSort(int arr[], int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

int readFile(const char *filename, int arr[], int n) {
    FILE *f = fopen(filename, "r");
    if (!f) {
        printf("File not found: %s\n", filename);
        return 0;
    }

    for (int i = 0; i < n && !feof(f); i++)
        fscanf(f, "%d", &arr[i]);

    fclose(f);
    return 1;
}

void printArray(int arr[], int n) {
    for (int i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

int main() {
    int arr[N];
    clock_t start, end;
    double time_taken;
    

    if (readFile("../Arrays/best_case_100000.txt", arr, N)) {
        start = clock();
        quickSort(arr, 0, N - 1);
        end = clock();
        time_taken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Best case of %d elements: %f ms\n", N, time_taken);
    }

    if (readFile("../Arrays/average_case_100000.txt", arr, N)) {
        start = clock();
        quickSort(arr, 0, N - 1);
        end = clock();
        time_taken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Average case of %d elements: %f ms\n", N, time_taken);
    }

    if (readFile("../Arrays/worst_case_100000.txt", arr, N)) {
        start = clock();
        quickSort(arr, 0, N - 1);
        end = clock();
        time_taken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Worst case of %d elements: %f ms\n", N, time_taken);
    }

    return 0;
}
