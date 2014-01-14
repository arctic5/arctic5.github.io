#include <stdio.h>
#include <math.h>

int main()
{
    while(1)
    {
        float a, b, c, d, s1, s2, s;
        printf("Arctic's Quadratic Calculator.\n");
        printf("Gets the solution(s) of any equation ax^2+bx+c=0.\n");
        printf("Please enter a: ");
        scanf("%f", &a);

        printf("Please enter b: ");
        scanf("%f", &b);

        printf("Please enter c: ");
        scanf("%f", &c);

        //quadratic equation
        d = (b*b-4*a*c);

        if (d > 0)
        {
            s1 = (-b + sqrt(d)/(2*a));
            s2 = (-b - sqrt(d)/(2*a));
            printf ("2 Solutions\n");
            printf ("Solution 1: ");
            printf ("%f", s1);
            printf ("\n");
            printf ("Solution 2: ");
            printf ("%f", s2);
            printf ("\n");
        }
        else if (d == 0)
        {
            s = (-b/(2*a));
            printf ("One Solution: ");
            printf ("%f", s);
            printf ("\n");
        }
        else
        {
            printf ("No real solutions");
            printf ("\n");
        }
    }
}
