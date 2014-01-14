#include <stdio.h>
#include <ctype.h>

int main()
{
    while(1)
    {
        float x1, x2, y1, y2,x ,y;
        printf("Arctic's Midpoint Calculator\n");
        printf("Calculates the midpoint of a line formed by the given coordinates\n");
        printf("Please enter x1: ");
        scanf("%f", &x1);
        printf("Please enter x2: ");
        scanf("%f", &x2);
        printf("Please enter y1: ");
        scanf("%f", &y1);
        printf("Please enter y2: ");
        scanf("%f", &y2);
        //midpoint formula
        x = (x1+x2)/2;
        y = (y1+y2)/2;
        printf("x = %.4f\n", x);
        printf("y = %.4f\n", y);;
    }
}
