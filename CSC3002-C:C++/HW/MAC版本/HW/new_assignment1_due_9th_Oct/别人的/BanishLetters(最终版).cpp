/*
 * File: BanishLetters.cpp
 * -----------------------
 * This program removes all instances of a set of letters from
 * an input file.
 */

#include <iostream>
#include <string.h>
#include "csc300222fall/assignment1/lib.h" //for local version
using namespace std;
char a[100];
int banishLetters() {
   // TODO
    char x;
    char key[100],key1[100];
    scanf("%s\n",&key);
    int num=0;
    int len=strlen(key);
    for(int i=0;i<len;i++){
        if(key[i]>=65&&key[i]<=90)key1[i]=key[i]+32;
        else key1[i]=key[i]-32;
    }
    cin.getline(a,1000,EOF);
    while(a[num]!='\0'){
        int k=0;
        for(int i=0;i<len;i++){
            if(a[num]==key[i] || a[num]==key1[i]){num++;k=1;break;}
        }
        if(k==1)continue;
        printf("%c",a[num++]);
    }
   return 0;
}


/* DO NOT modify this main() part */
/*
 sample output:
 input: S
        this is a testing 1
        this is a testing 2
 output:
        thi i a teting 1
        thi i a teting 2
*/
int main(int argc, char* argv[]) {
    banishLetters();
    return 0;
}
