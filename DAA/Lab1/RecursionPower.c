#include <stdio.h>

int calPower(int base, int power) {
    if (power == 0) {
        return 1;
    }
    
    return base * calPower(base, power - 1);
}

void main() {
    int base, power;
    
    printf("Enter a Base: ");
    scanf("%d", &base);

    printf("Enter a Power: ");
    scanf("%d", &power);

    printf("%d raised to the power of %d is %d", base, power, calPower(base, power));
}
