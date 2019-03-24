//
//  main.c
//  Assembly
//
//  Created by Alireza Ghodrati on 1/2/1398 AP.
//  Copyright © 1398 AP Alireza Ghodrati. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>

#define BILLION  1000000000L

#define rotateleft(x,n) ((x<<n) | (x>>(32-n)))
#define rotateright(x,n) ((x>>n) | (x<<(32-n)))




void HASH(unsigned char * str1)
{
    unsigned long int h0, h1, h2, h3, h4, a, b, c, d, e, f, k, temp;
    int i = 0;
    int j = 0;
    h0 = 0x67452301;
    h1 = 0xEFCDAB89;
    h2 = 0x98BADCFE;
    h3 = 0x10325476;
    h4 = 0xC3D2E1F0;


    unsigned char * str;
    str = (unsigned char *)malloc(strlen((const char *)str1) + 100);
    strcpy(str, str1);

    int current_length = strlen(str);

    //printf("\n current_length_0: %d",current_length);

    int original_length = current_length;

    str[current_length] = 0x80;
    current_length++;

   // printf("\n current_length_1: %d",current_length);


    int ib = current_length % 64;
    if (ib < 56)
        ib = 56 - ib;
    else
        ib = 120 - ib;

    for (i = 0; i < ib; i++)
    {
        str[current_length] = 0x00;
        current_length++;
    }

   // printf("\n current_length_2: %d",current_length);


    str[current_length + 1] = '\0';


    for (i = 0; i < 6; i++)
    {
        str[current_length] = 0x00;
        current_length++;
    }

    //printf("\n current_length_3: %d",current_length);


    str[current_length] = (original_length * 8) / 0x100;

    current_length++;
    //printf("\n%d\n",original_length);
    str[current_length] = (original_length * 8) % 0x100;

    //printf("\n%x\n",str[63]);



    current_length++;



    str[current_length + i] = '\0';



    //printf("\n current_length_4: %d",current_length);


    int number_of_chunks = current_length / 64;

  //  printf("\n number_of_chunks: %d\n",number_of_chunks);

    unsigned long int word[80];



    for (i = 0; i < number_of_chunks; i++)
    {

        for (j = 0; j < 16; j++)
        {




            word[j] =
                    str[i * 64 + j * 4] * 0x1000000
                    +
                    str[i * 64 + j * 4 + 1] * 0x10000
                    +
                    str[i * 64 + j * 4 + 2] * 0x100
                    +
                    str[i * 64 + j * 4 + 3];

            // printf("%d : %x  \n",j,word[j]);
            //printf("%d : %x\n",j,str[i * 64 + j * 4 + 3]);



        }

        //printf(" %x \n",word[15]);

        for (j = 16; j < 80; j++)
        {


            word[j] = rotateleft(
                    (
                            word[j - 3]
                            ^
                            word[j - 8]
                            ^
                            word[j - 14]
                            ^
                            word[j - 16]
                    )

            , 1);

         //   printf("j=%d : %x\n",j,word[j]);



        }
        //printf("\n %s",word);
        a = h0;
        b = h1;
        c = h2;
        d = h3;
        e = h4;

        //Hash: ece296f3 155eff9c9 e74c0cf272f9dcc 33aa997483dcedea c312c1e10040e0d

        for (int m = 0; m < 80; m++)
        {
            if (m < 20)
            {
                f = (b & c) | ((~b) & d);
                k = 0x5A827999;
            }
            else if (m < 40)
            {
                f = b ^ c ^ d;
                k = 0x6ED9EBA1;
            }
            else if (m < 60)
            {
                f = (b & c) | (b & d) | (c & d);
                k = 0x8F1BBCDC;
            }
            else
            {
                f = b ^ c ^ d;
                k = 0xCA62C1D6;
            }
            //printf("\n K = %x , f = %x ",k,f);
            //if(m > 15) //cd1829cc
            //      printf("\n m=%d : %x",m,word[m]);


            temp = (rotateleft(a, 5) + f + e + k + word[m]) & 0xFFFFFFFF;
            e = d;
            d = c;
            c = rotateleft(b, 30);
            b = a;
            a = temp;
        }
        h0 = h0 + a;
        h1 = h1 + b;
        h2 = h2 + c;
        h3 = h3 + d;
        h4 = h4 + e;
    }
   // printf("\n\n");
    printf("HASH In C: %x%x%x%x%x", h0, h1, h2, h3, h4);
   // printf("\n\n");
}

uint64_t current_timestamp(){
    long int ns;
    time_t sec;
    struct timespec spec;

    clock_gettime(CLOCK_REALTIME, &spec);
    sec = spec.tv_sec;
    ns = spec.tv_nsec;
    return  (uint64_t) sec * BILLION + (uint64_t) ns;
}

extern char* ASM_HASH(char *str);


int main(int argc, const char * argv[]) {



    char txt[100];
     printf("Enter Txt :");
     gets(txt);
    uint64_t before,after;

    before=current_timestamp();
    char * res = ASM_HASH(txt);
    after = current_timestamp();


    printf("\n\n HASH In ASM Is:");
    int len = strlen(res) -1 ;

    for (int i = len; i >= 0 ; i--)
        printf("%02x", (unsigned char) res[i]);


    printf("   With Length : %i   Calculation Time : %lli In Nano.\n\n "
            ,len,after-before);

    before=current_timestamp();
    HASH((unsigned char *) txt);
    after=current_timestamp();


    printf("   Calculation Time : %lli In Nano.\n\n ",after-before);

    return 0;
}
