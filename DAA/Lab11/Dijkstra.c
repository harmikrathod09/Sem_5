#include <stdio.h>
#include <limits.h>

#define V 5

int findMindistanceance(int distance[], int visited[])
{
    int min = INT_MAX, minIndex;
    for (int i = 0; i < V; i++)
    {
        if (visited[i] == 0 && distance[i] < min)
        {
            min = distance[i];
            minIndex = i;
        }
    }
    return minIndex;
}

void dijkstra(int graph[V][V])
{
    int distance[V];
    int visited[V];

    for (int i = 0; i < V; i++)
    {
        distance[i]=INT_MAX;
        visited[i]=0;
    }

    distance[0]=0;

    for (int i = 0; i < V-1; i++)
    {
       int u=findMindistanceance(distance,visited);
       visited[u]=1;

       for (int v = 0; v < V; v++) {
            if (!visited[v] && graph[u][v] && distance[u] != INT_MAX && distance[u] + graph[u][v] < distance[v]) {
                distance[v] = distance[u] + graph[u][v];
            }
        }
    }
    
    for (int i = 0; i < V; i++)
    {
       printf("%d ",distance[i]);
    }
    
}

void main()
{
    int graph[V][V] = {
        {0, 10, 0, 30, 100},
        {10, 0, 50, 0, 0},
        {0, 50, 0, 20, 10},
        {30, 0, 20, 0, 60},
        {100, 0, 10, 60, 0}};
    dijkstra(graph);
}