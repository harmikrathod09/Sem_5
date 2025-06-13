#include <stdio.h>
#include <stdlib.h>

struct Node
{
    int data;
    struct Node *next;
};

struct Node *head = NULL;

void insertAtLast(int value)
{
    struct Node *newNode = (struct Node *)malloc(sizeof(struct Node));

    newNode->data=value;
    newNode->next=NULL;

    if (head==NULL)
    {
        head=newNode;
    }
    else
    {
       struct Node* temp =head;
       while (temp->next!=NULL)
       {
            temp=temp->next;
       }
       temp->next=newNode;
    }
    
}

void deleteAtLast()
{
    if (head->next==NULL)
    {
        printf("List is empty");
        return;
    }

    if (head->next==NULL)
    {
        free(head);
        head=NULL;
        return;
    }
    
    struct Node* temp=head;

    while (temp->next->next!=NULL)
    {
        temp=temp->next;
    }

    free(temp->next);
    temp->next=NULL;
    
}

void dispaly(){
    struct Node* temp =head;
    while (temp!=NULL)
    {
        printf("%d -> ",temp->data);
        temp=temp->next;
    }
    
}

int main()
{
    int choice,value;

    while (1)
    {
        printf("\n1. Insert at last\n2. Delete at last\n3. Display\n4. Exit\nEnter your choice: ");
        scanf("%d", &choice);
    
        switch (choice)
        {
        case 1:
            printf("Enter value to insert: ");
            scanf("%d",&value);
            insertAtLast(value);
            break;
        
        case 2:
            deleteAtLast();
            break;
        
        case 3:
            dispaly();
            break;
    
        case 4:
            exit(0);
            break;
        
        default:
            printf("Invalid choice. Try again.\n");
            break;
        }
    }
    
    return 0;
  
}