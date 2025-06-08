#include <stdio.h>

void main()
{
    int n, fact, i;

    printf("Enter a Number: ");
    scanf("%d", &n);

    fact = n;
    for (i = n - 1; i > 0; i--)
    {
        fact *= i;
    }

    printf("Factorial of %d is %d", n, fact);
}