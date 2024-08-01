/*
 * File: BanishLetters.cpp
 * -----------------------
 * This program removes all instances of a set of letters from
 * an input file.
 */

#include <iostream>
#include "csc300222fall/assignment1/lib.h" //for local version
using namespace std;

int banishLetters() {
   string ban,ban1,txt;
   cin>>ban;
   ban1+=toUpperCase(ban);
   ban1+=toLowerCase(ban);
   while (getline(cin,txt))
   {
       if (txt=="") {
              continue;
       }
       int len=ban1.size();
       for (int i = 0; i < len; i++){
              while (txt.find(ban1[i]!=-1)){
                     txt.erase(txt.find(ban[i]));
              }
                     
       }
       cout<<txt<<endl;  
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
