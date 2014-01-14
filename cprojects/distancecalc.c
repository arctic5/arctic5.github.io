#include <stdio.h>
#include <math.h>

int main()
{
    while(1)
    {
        float x1, x2, y1, y2, d;
        printf("Arctic's Distance Calculator.\n");
        printf("Calculates the distance between any 2 given coordinates.\n");
        printf("x1= ");
        scanf("%f", &x1);

        printf("x2= ");
        scanf("%f", &x2);

        printf("y1= ");
        scanf("%f", &y1);

        printf("y2= ");
        scanf("%f", &y2);

        //distance formula
        //because fuck you its late and
        //im not looking up how to do exponents in c
        d = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));

        printf ("%f\n", d);
    }
}
