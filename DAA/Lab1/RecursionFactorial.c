#include<stdio.h>

int findFact(int n){
    if(n==0 || n==1){
        return 1;
    }
    return n*findFact(n-1);
}

void main(){
    int n,fact;
    
    printf("Enter a Number: ");
    scanf("%d",&n);
    
    fact=findFact(n);
    
    printf("Factorial of %d is %d",n,fact);
}