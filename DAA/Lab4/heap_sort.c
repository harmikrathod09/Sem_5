#include <stdio.h>
#include <time.h>
#define N 100

void max_heapify(int arr[], int n, int i)
{
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;
    int temp;

    // if (left < n && arr[left] > arr[largest])
        

   
}

void build_max_heap(int arr[], int n)
{
    for (int i = n / 2 - 1; i >= 0; i--)
    {
        max_heapify(arr, n, i);
    }
}

void heapSort(int arr[],int n){
    build_max_heap(arr,n);
}

void heapSort(){

}