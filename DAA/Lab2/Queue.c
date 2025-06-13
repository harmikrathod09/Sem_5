#include <stdio.h>
#include <stdlib.h>
#define MAX 100

int queue[MAX];
int front = -1, rear = -1;

void enqueue(int ele)
{
    if (rear == MAX - 1)
    {
        printf("Queue Overflow\n");
        return;
    }
    if (front == -1)
    {
        front = 0;
    }
    queue[++rear] = ele;
    printf("Element enqueued %d", ele);
}

void dequeue()
{
    if (front == -1 || front > rear)
    {
        printf("Queue Underflow\n");
        return;
    }
    printf("Element dequeued %d\n", queue[front]);
    front++;
    if (front == rear)
    {
        front = -1;
        rear = -1;
    }
}

void display()
{
    if (front == -1 || front > rear)
    {
        printf("Queue Underflow\n");
        return;
    }
    for (int i = front; i <= rear; i++)
    {
        printf("%d ", queue[i]);
    }
    printf("\n");
}

int main()
{
    int choice, value;

    while (1)
    {
        printf("\n1. Enqueue\n2. Dequeue\n3. Display\n4. Exit\nEnter a choice: ");
        scanf("%d", &choice);

        switch (choice)
        {
        case 1:
            printf("Enter a element: ");
            scanf("%d",&value);
            enqueue(value);
            break;
        
        case 2:
            dequeue();
            break;
        
        case 3:
            display();
            break;
        
        case 4:
            exit(0);
            break;
        
        default:
            break;
        }
    }

    return 0;
}
