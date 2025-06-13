#include<stdio.h>
#include<stdlib.h>
#define MAX 100

int stack[MAX];
int top=-1;

void push(int ele){
    if(top==MAX-1){
        printf("Stack is Overflow\n");
        return;
    }
    stack[++top]=ele;
    printf("Element pushed %d\n",ele);
}

void pop(){
    if (top==-1)
    {
        printf("Stack is underflow\n");
        return;
    }
    printf("Element poped %d\n",stack[top]);
    --top;
}

void display(){
    if (top==-1)
    {
        printf("Stack is underflow\n");
        return;
    } 
    for (int i=top; i > -1; i--)
    {
        printf("%d ",stack[i]);
    }
}

void peek(){
    if (top==-1)
    {
        printf("Stack is underflow\n");
        return;
    } 
    printf("Element peeked %d\n",stack[top]);
}

void peep(int pos){
    if (top-pos+1<0)
    {
       printf("Stack don't have a element\n");
    }
    printf("Element Peep in %d is %d\n",pos,stack[top-pos+1]);
}

void change(int ele,int pos){
     if (top-pos+1<0)
    {
       printf("Stack don't have a element\n");
    }
    stack[top-pos+1]=ele;
}

int main(){
    int pos,choice,value;

while (1)
{
    printf("\n1. Push\n2. Pop\n3. Display\n4. Peek\n5. Peep\n6. Change\n7. Exit\nEnter a choice: ");
    scanf("%d",&choice);

    switch (choice)
    {
        case 1:
            printf("Enter a element: ");
            scanf("%d",&value);
            push(value);
            break;
        case 2:
            pop();
            break;
        case 3:
            display();
            break;
        case 4:
            peek();
            break;
        case 5:
            printf("Enter position: ");
            scanf("%d",&pos);
            peep(pos);
            break;
        case 6:
            printf("Enter position: ");
            scanf("%d",&pos);
              printf("Enter a element: ");
            scanf("%d",&value);
            change(value,pos);
            break;
        case 7:
            exit(0);
            break;
        default:
            printf("Enter valid choice\n");
            break;
    }
}


    return 0;
}