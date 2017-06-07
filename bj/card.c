#include <stdlib.h>
#include <stdio.h>

/* Arrange the N elements of ARRAY in random order.
 * Only effective if N is much smaller than RAND_MAX;
 * if this may not be the case, use a better random
 * number generator. */
void
shuffle(int *array, size_t n)
{
    if (n > 1) {
        size_t i;
        for (i = 0; i < n - 1; i++) {
            size_t j = i + rand() / (RAND_MAX / (n - i) + 1);
            int t = array[j];
            array[j] = array[i];
            array[i] = t;
        }
    }
}

int *card_init(int n_decks, size_t *total_cards)
{
    size_t total = n_decks * 52;
    int i;
    int *cards;

    cards = (int *)malloc(total * sizeof(int));

    for (i = 0; i < total; i++) {
        cards[i] = i;
    }
    
    shuffle(cards, total);

    *total_cards = total;
    return cards;
}

void display_card(int i, int card) {
    int n_deck = card / 52;
    int suite = card % 52 / 13;
    int value = card % 52 % 13;

    printf("%d: deck %d, suit %d, value %d\n", i, n_deck, suite, value);
}

void main()
{
    size_t total;
    int *cards;
    int i;

    cards = card_init(1, &total);

    for (i = 0; i < total; i++) {
        display_card(i, cards[i]);
    }

}
