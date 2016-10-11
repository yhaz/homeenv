#include <stdio.h>
#include <stdlib.h>

struct node {
    int x;
    struct node  *next;
};

#define LL_NODE(V, N) &(struct node){.x=(V), .next=(N)}
#define LL_2_NODES(value, value2)  LL_NODE(value, LL_NODE(value2, NULL))
#define LL_3_NODES(value, value2, value3)  \
    LL_NODE(value, LL_2_NODES(value2, value3))


int main(void)
{
    struct node *l;

    l = LL_3_NODES(1 ,2, 3);

    while (l) {
        printf("%d\n", l->x);
        l = l->next;
    }

    return 0;
}



