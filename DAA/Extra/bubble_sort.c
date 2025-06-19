#include <stdio.h>
#include <time.h>

int main()
{
    int ch, i, j, temp, n;
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
    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n - i - 1; j++)
        {
            if (arr[j] > arr[j + 1])
            {
                temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
    end = clock();


    printf("Sorted Array is using bubble sort: \n");
    for (i = 0; i < n; i++)
    {
        printf("%d\n", arr[i]);
    }

    cpu_time = (double)(end - start) / CLOCKS_PER_SEC;
    printf("CPU TIME:%f sec", cpu_time);

    return 0;
}