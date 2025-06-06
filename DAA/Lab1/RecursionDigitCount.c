#include <stdio.h>

int calDigit(int n) {
    if (n == 0) {
        return 0;
    } else {
        return 1 + calDigit(n / 10);  
    }
}

void main() {
    int n;
    
    printf("Enter a Number: ");
    scanf("%d", &n);

    if (n == 0) {
        printf("Digit of %d is 1\n", n);
    } else {
        printf("Digit of %d is %d\n", n, calDigit(n));
    }

}
