#include <stdio.h>

void main() {
    int base, power,i, calPower=1;
    
    printf("Enter a Base: ");
    scanf("%d", &base);

    printf("Enter a Power: ");
    scanf("%d", &power);

    for(i=1;i<=power;i++){
        calPower=calPower*base;
    }
    
    printf("%d power of %d is %d",base,power,calPower);
}
