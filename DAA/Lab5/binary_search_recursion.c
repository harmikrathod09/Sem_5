#include <stdio.h>
#include <time.h>

#define N 100
int arr[N];

int binarySearch(int ele, int low, int high)
{
    int mid;
    while (low <= high)
    {
        mid = (low + high) / 2;
        if (arr[mid] == ele)
        {
            return mid;
        }
        else if (arr[mid] < ele)
        {
            return binarySearch(ele,mid + 1,high);
        }
        else if (arr[mid] > ele)
        {
            return binarySearch(ele,low, mid - 1);
        }
    }
    return -1;
}

int readFile(const char *filename, int n)
{
    FILE *f = fopen(filename, "r");
    if (!f)
    {
        printf("File not found\n");
        return 0;
    }

    for (int i = 0; i < n; i++)
    {
        fscanf(f, "%d", &arr[i]);
    }

    fclose(f);
    return 1;
}

void main()
{
    clock_t start, end;
    double time_taken;
    int ele, index, low = 0, high = N - 1;
    if (readFile("../Arrays/best_case_100000.txt", N))
    {
        printf("Enter a Element: ");
        scanf("%d", &ele);
        start = clock();
        index = binarySearch(ele, low, high);
        end = clock();
        if (index == -1)
        {
            printf("Element is not found\n");
        }
        else
        {
            printf("Index of %d is %d\n", ele, index);
        }
        time_taken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Best case of Element %d is %f\n", N, time_taken);
    }
}