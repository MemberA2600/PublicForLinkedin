#include <stdio.h>

// sound.c
// version 0.2
//
// Copyright (c) 2003 Adam Wozniak (adam@xxxxxxxxxxxxxxxx)
// All Rights Reserved
//
// Permission granted to freely copy and use for any purpose, provided
// this copyright header remains intact.

// compressed polynomial tables...
static const int poly0[] = { // all ones
        1, -1 };
static const int poly1[] = { // 50% duty cycle
        1, 1, -1 };
static const int poly2[] = { // 16/31 duty cycle
        16, 15, -1 };
static const int poly4[] = { // 4 bit LFSR
        1, 2, 2, 1, 1, 1, 4, 3, -1 };
static const int poly5[] = { // 5 bit LFSR
        1, 2, 1, 1, 2, 2, 5, 4, 2, 1, 3, 1, 1, 1, 1, 4,
        -1 };
static const int poly9[] = { // 9 bit LFSR
        1, 4, 1, 3, 2, 4, 1, 2, 3, 2, 1, 1, 1, 1, 1, 1,
        2, 4, 2, 1, 4, 1, 1, 2, 2, 1, 3, 2, 1, 3, 1, 1,
        1, 4, 1, 1, 1, 1, 2, 1, 1, 2, 6, 1, 2, 2, 1, 2,
        1, 2, 1, 1, 2, 1, 6, 2, 1, 2, 2, 1, 1, 1, 1, 2,
        2, 2, 2, 7, 2, 3, 2, 2, 1, 1, 1, 3, 2, 1, 1, 2,
        1, 1, 7, 1, 1, 3, 1, 1, 2, 3, 3, 1, 1, 1, 2, 2,
        1, 1, 2, 2, 4, 3, 5, 1, 3, 1, 1, 5, 2, 1, 1, 1,
        2, 1, 2, 1, 3, 1, 2, 5, 1, 1, 2, 1, 1, 1, 5, 1,
        1, 1, 1, 1, 1, 1, 1, 6, 1, 1, 1, 2, 1, 1, 1, 1,
        4, 2, 1, 1, 3, 1, 3, 6, 3, 2, 3, 1, 1, 2, 1, 2,
        4, 1, 1, 1, 3, 1, 1, 1, 1, 3, 1, 2, 1, 4, 2, 2,
        3, 4, 1, 1, 4, 1, 2, 1, 2, 2, 2, 1, 1, 4, 3, 1,
        4, 4, 9, 5, 4, 1, 5, 3, 1, 1, 3, 2, 2, 2, 1, 5,
        1, 2, 1, 1, 1, 2, 3, 1, 2, 1, 1, 3, 4, 2, 5, 2,
        2, 1, 2, 3, 1, 1, 1, 1, 1, 2, 1, 3, 3, 3, 2, 1,
        2, 1, 1, 1, 1, 1, 3, 3, 1, 2, 2, 3, 1, 3, 1, 8,
        -1 };
static const int poly68[] = { // used by mode 15
        5, 6, 4, 5, 10, 5, 3, 7, 4, 10, 6, 3, 6, 4, 9, 6, -1 };
static const int poly465[] = { // used by mode 3
        2, 3, 2, 1, 4, 1, 6, 10, 2, 4, 2, 1, 1, 4, 5,
        9, 3, 3, 4, 1, 1, 1, 8, 5, 5, 5, 4, 1, 1, 1,
        8, 4, 2, 8, 3, 3, 1, 1, 7, 4, 2, 7, 5, 1, 3,
        1, 7, 4, 1, 4, 8, 2, 1, 3, 4, 7, 1, 3, 7, 3,
        2, 1, 6, 6, 2, 2, 4, 5, 3, 2, 6, 6, 1, 3, 3,
        2, 5, 3, 7, 3, 4, 3, 2, 2, 2, 5, 9, 3, 1, 5,
        3, 1, 2, 2, 11, 5, 1, 5, 3, 1, 1, 2, 12, 5, 1,
        2, 5, 2, 1, 1, 12, 6, 1, 2, 5, 1, 2, 1, 10, 6,
        3, 2, 2, 4, 1, 2, 6, 10, -1 };

static const int divisors[] = { // frequency dividers
        1, 1, 15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3, 1 };
static const int *polys[] = { // polynomial table
        poly0, poly4, poly4, poly465,
        poly1, poly1, poly2, poly5,
        poly9, poly5, poly2, poly0,
        poly1, poly1, poly2, poly68 };

struct state
{
        int offset, count, f;
        int rate;
        char last;
};

void TIASOUND_initstate(struct state *s)
{
        s->offset = 0;
        s->count = 0;
        s->last = 1;
        s->f = 0;
        s->rate = 0;
}

void TIASOUND_fill(int F, int V, int C,
                   int infrequency, int outfrequency, int channels,
                   char *buf, int size,
                   struct state *s)
{
        int value;

        while (size)
        {
                s->f++;
                if (s->f == divisors[C] * (F+1))
                {
                        const int *poly = polys[C];
                        s->f = 0;

                        s->count++;
                        if (s->count == poly[s->offset])
                        {
                                s->offset++;
                                s->count = 0;
                                if (poly[s->offset] == -1)
                                {
                                        s->offset = 0;
                                }
                        }
                        s->last = ! (s->offset & 0x01);
                }

                s->rate += outfrequency;

                while (s->rate >= infrequency && size)
                {
                        *buf += s->last ? (V << 3): 0;
                        s->rate -= infrequency;

                        buf += channels;
                        size -= channels;
                }
        }
}

void createTone(char *buf, int AUDF, int AUDV, int AUDC)
{
        struct state s;
        int i;
        // char buf[44100];

        // be sure to reset s whenever C, F, or V change
        TIASOUND_initstate(&s);

        // clear the buffer
        // bzero(buf, sizeof(buf));

        // fill the buffer
        TIASOUND_fill(AUDF, AUDV, AUDC,
                      31456, 44100, 1,
                      buf, sizeof(buf), &s);

}
