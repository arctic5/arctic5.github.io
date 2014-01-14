#include <stdio.h>
#include <stdlib.h>

int main()
{
    while(1)
    {
        float x1, x2, y1, y2,x ,y;
        printf("Midpoint Calculator\n");
        printf("x1= ");
        scanf("%f", &x1);
        printf("x2= ");
        scanf("%f", &x2);
        printf("y1= ");
        scanf("%f", &y1);
        printf("y2= ");
        scanf("%f", &y2);
        //midpoint formula
        x = (x1+x2)/2;
        y = (y1+y2)/2;
        printf("x = %.4f\n", x);
        printf("y = %.4f\n", y);;
    }
}
