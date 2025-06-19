#include<stdio.h>
#include<stdlib.h>
void main(){
    FILE *fp1=fopen("best.txt","w");
    FILE *fp2=fopen("worst.txt","w");
    FILE *fp3=fopen("average.txt","w");

    for (int i = 1; i < 1000; i++)
    {
        fprintf(fp1,"%d\n",i);
        fprintf(fp2,"%d\n",1000-i+1);
        fprintf(fp3,"%d\n",rand());
    }
    
    fclose(fp1);
    fclose(fp2);
    fclose(fp3);
}