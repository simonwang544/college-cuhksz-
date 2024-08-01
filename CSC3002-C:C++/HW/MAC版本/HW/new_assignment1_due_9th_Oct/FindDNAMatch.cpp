/* Q2: 
 * File: FindDNAMatch.cpp
 * ----------------------
 * This file solves the DNA matching exercise from the text.
 */
// header file for OJ system
// #include <iostream>
// #include <string>

// using namespace std;

#include <iostream>
#include <string>
#include "csc300222fall/assignment1/FindDNAMatch.h" //for OJ
using namespace std;


/*
 * Function: findDNAMatch
 * Usage: int pos = findDNAMatch(s1, s2);
 *        int pos = findDNAMatch(s1, s2, start);
 * ---------------------------------------------
 * Returns the first index position at which strand s1 would bind to
 * the strand s2, or -1 if no such position exists.  If the start
 * parameter is supplied, the search begins at that index position.
 */

int findDNAMatch(string s1, string s2, int start) {
   // TODO
   return s2.find(matchingStrand(s1),start);
}

/*
 * Function: matchingStrand
 * Usage: string match = matchingStrand(strand);
 * ---------------------------------------------
 * Returns a string in which each base has been replaced by its
 * counterpart base (C <-> G and A <-> T).  Any other characters
 * are replaced by an X.
 */

string matchingStrand(string strand) {
   // TODO
    string s_temp;
    s_temp.assign(strand);
    int strand_size = strand.size();
   for(int i = 0; i < strand_size; i++)
   {
      if (strand[i] == 'A')
      {
         s_temp[i] = 'T';
      }
      else if(strand[i] == 'T')
      {
         s_temp[i] = 'A';
      }
      else if(strand[i] == 'C')
      {
         s_temp[i] = 'G';
      }
      else if(strand[i] == 'G')
      {
         s_temp[i] = 'C';
      }
      else
      {
         s_temp[i] = 'X';
      }
   }
   return s_temp;
}

/*
 * Function: findAllMatches
 * Usage: findAllMatches(s1, s2);
 * ------------------------------
 * Finds all positions at which s1 can bind to s2.
 */

void findAllMatches(string s1, string s2) {
   // TODO
   int start = 0;
   string s2_change = s2;
   int s2_size = s2.size();
   while(start < s2_size)
   {
      if (findDNAMatch(s1,s2_change,start) == -1)
      {
         if (start ==0)
         {
            cout << s1 << " has no matches in " << s2 <<endl;
         break;
         }
         else
         {
            break;
         }
      }
      else
      {
      cout << s1 << " matches " << s2 << " at position "<<  findDNAMatch(s1,s2_change,start) <<endl;
      start = findDNAMatch(s1,s2_change,start) +1;
      }
   }
}

// DO NOT modify the main() function
/*
 * sample output:
 * input:  TTGCC TAACGGTACGTC
 * output: TTGCC matches TAACGGTACGTC at position 1
*/
int main(int argc, char* argv[]) {
    string s1, s2;
    cin >> s1 >> s2; 
    findAllMatches(s1, s2);
    return 0;
}