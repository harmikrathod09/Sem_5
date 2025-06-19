#include <stdio.h>
#include <time.h>

int main()
{
    int ch, i, j, n, min_idx, temp;
    FILE *fp;
    double cpu_time;
    clock_t start, end;

    printf("Enter N:");
    scanf("%d", &n);

    int arr[n];

    printf("Enter a choice\n1.Best Case\n2.Average Case\n3.Worst Case\n");
    scanf("%d", &ch);

    switch (ch)
    {
    case 1:
        fp = fopen("best.txt", "r");
        break;

    case 2:
        fp = fopen("average.txt", "r");
        break;

    case 3:
        fp = fopen("worst.txt", "r");
        break;

    default:
        printf("Invalid Choice");
        break;
    }

    for (i = 0; i < n; i++)
    {
        fscanf(fp, "%d", &arr[i]);
    }

    start = clock();
    for (i = 0; i < n - 1; i++)
    {
        min_idx = i;

        for (j = i + 1; j < n; j++)
        {
            if (arr[j] < arr[min_idx])
            {
                min_idx = j;
            }

            temp = arr[i];
            arr[i] = arr[min_idx];
            arr[min_idx] = temp;
        }
    }

    end = clock();

    printf("Sorted Array is using insertion sort: \n");
    for (i = 0; i < n; i++)
    {
        printf("%d\n", arr[i]);
    }

    cpu_time = (double)(end - start) / CLOCKS_PER_SEC;
    printf("CPU TIME:%f sec", cpu_time);

    return 0;
}