#include <stdio.h>
#include <conio.h>
#define V 8

int queue[10];
int front = -1, rear = -1;

int isEmpty() {
    return front == -1;
}

void enqueue(int key) {
    if (rear == 9) return; 
    if (front == -1) front = 0;
    queue[++rear] = key;
}

int dequeue() {
    if (isEmpty()) return -1;
    int item = queue[front];
    if (front == rear) {
        front = rear = -1;                                                                            
    } else {
        front++;
    }
    return item;
}

void BFS(int graph[V][V]) {
    int visited[V] = {0};
    enqueue(0);
    visited[0] = 1;

    printf("BFS traversal: ");

    while (!isEmpty()) {
        int current = dequeue();
        printf("%d ", current + 1);

        for (int i = 0; i < V; i++) {
            if (graph[current][i] && !visited[i]) {
                enqueue(i);
                visited[i] = 1;
            }
        }
    }
}

int main() {
    int graph[V][V]={
        {0, 1, 1, 0, 0, 0, 0, 0},
        {1, 0, 1, 1, 0, 0, 0, 0},
        {1, 1, 0, 0, 1, 0, 0, 0},
        {0, 1, 0, 0, 1, 1, 0, 0},
        {0, 0, 1, 1, 0, 0, 1, 0},
        {0, 0, 0, 1, 0, 0, 1, 1},
        {0, 0, 0, 0, 1, 1, 0, 1},
        {0, 0, 0, 0, 0, 1, 1, 0}
    };

    BFS(graph);

    getch();
    return 0;
}