#include <stdio.h>
#define int long long

void bubblesort(int n, int *a);

int main()
{
    int n;
    scanf("%lld", &n);
    int a[n];
    for (int i = 0; i < n; i++)
    {
        scanf("%lld", &a[i]);
    }

    bubblesort(n, a);
    
    for (int i = 0; i < n; i++)
    {
        printf("%lld ", a[i]);
    }
    printf("\n");

    return 0;
}