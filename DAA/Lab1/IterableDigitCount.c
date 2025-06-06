#include<stdio.h>

void main(){
    int n,digit=0,i,original;
    
    printf("Enter a Number: ");
    scanf("%d",&n);
    original=n;
    
    while(n!=0){
        digit++;
        n/=10;
    }
    
    printf("Digit of %d is %d",original,digit);
}