/* Q3
 * File: MorseCode.cpp
 * -------------------
 * This program translates to and from Morse Code using maps to
 * assist in the translation.
 */

#include <iostream>
#include <string>
#include <map>
#include "csc300222fall/assignment2/lib.h" 
#include "csc300222fall/assignment2/morsecode.h" 
#include <sstream>
#include <fstream>
#include <iomanip>
using namespace std;
std::string toUpperCase(std::string str) {
   for (int i = 0; i < str.length(); i++) {
        str[i] = toupper(str[i]);
   }
   return str;
}

/*
 * TODO function
 * Function: translateLettersToMorse
 * Usage: string morse = translateLettersToMorse(line);
 * ----------------------------------------------------
 * Translates a string of letters into Morse Code characters separated
 * by spaces.  Characters that don't appear in the table are simply ignored.
 */

string translateLettersToMorse(string line) {
   // TODO
   int i = 0;
   string print_code ;
   map<string,string> m;
   m = createMorseCodeMap();
   while(i < int(line.size()))
   {
      if (line[i] == 'A' || line[i] == 'B' || line[i] == 'C' || line[i] == 'D' || line[i] == 'E' || line[i] == 'F' || line[i] == 'G' 
       || line[i] == 'H' || line[i] == 'I' || line[i] == 'J' || line[i] == 'K' || line[i] == 'L' || line[i] == 'M' || line[i] == 'N' 
       || line[i] == 'O' || line[i] == 'P' || line[i] == 'Q' || line[i] == 'R' || line[i] == 'S' || line[i] == 'T' || line[i] == 'U' 
       || line[i] == 'V' || line[i] == 'W' || line[i] == 'X' || line[i] == 'Y' || line[i] == 'Z')
      {
      map<string,string>::iterator pos;
      string new_line;
      new_line =  line[i];
      pos = m.find(new_line);
      print_code = print_code + (*pos).second+ " ";
      i=i+1;
      }
      else
      {
         line.erase(i,1);
         //cout<< "detele one";
      }
   }
   return print_code;
}

/*
 * TODO function
 * Function: translateMorseToLetters
 * Usage: string letters = translateLettersToMorse(line);
 * ------------------------------------------------------
 * Translates a string in Morse Code into English letters.
 * Because word breaks are not represented in Morse code, the
 * letters in the output will be run together.  The characters
 * of the Morse Code input must be separated by a single space.
 * Any other character in the input is simply ignored.  If there
 * is no English equivalent for the Morse Code character, this
 * function indicates that fact by inserting a question mark (?).
 *
 * Implementation note: To eliminate the special case of the last
 * character in the line, this function begins by adding a space
 * to the end of the input string.
 */

string translateMorseToLetters(string line) {
   // TODO
   line = line+" ";
   int k = 0;
   string print_letter;
   while (k <int(line.length()))
   {
      if (line[k] != ' ' && line[k] != '.' && line[k]!= '-')
      {
         line.erase(k,1);
         //cout<< "delete a another";
      }
      else
      {
         k=k+1;
      }
   }
   map<string,string> m3;
   m3 = createMorseCodeMap();
   map<string,string> m4;
   m4 = invertMap(m3);
   while(int (line.length()) != 0)
   {
      int pos_space = line.find(" ");
      if (pos_space == -1)
      {
         break;
      }
      else if(pos_space == 0)
      {
            line.erase(0,1);
            //cout<< "delete a spce";
      }
      else
         {
            string mosecode;
            mosecode = line.substr(0,pos_space);
            line.erase(0,pos_space+1);
            map<string,string>::iterator pos_mose;
            pos_mose = m4.find(mosecode);
            if(pos_mose != m4.end())
            {
               print_letter = print_letter + (*pos_mose).second;
               //cout<< "bingo one";
            }
            else
            {
               print_letter = print_letter + "?";
               //cout<< "have wrong input";
            }
         }
   }
   return print_letter;
}

/*
 * Function: createMorseCodeMap
 * Usage: map<string> map = createMorseCodeMap();
 * ----------------------------------------------
 * Returns a map in which each uppercase letter is mapped into its
 * Morse code equivalent.
 */

map<string,string> createMorseCodeMap() {
   map<string,string> map;
   map["A"] = ".-";
   map["B"] = "-...";
   map["C"] = "-.-.";
   map["D"] = "-..";
   map["E"] = ".";
   map["F"] = "..-.";
   map["G"] = "--.";
   map["H"] = "....";
   map["I"] = "..";
   map["J"] = ".---";
   map["K"] = "-.-";
   map["L"] = ".-..";
   map["M"] = "--";
   map["N"] = "-.";
   map["O"] = "---";
   map["P"] = ".--.";
   map["Q"] = "--.-";
   map["R"] = ".-.";
   map["S"] = "...";
   map["T"] = "-";
   map["U"] = "..-";
   map["V"] = "...-";
   map["W"] = ".--";
   map["X"] = "-..-";
   map["Y"] = "-.--";
   map["Z"] = "--..";
   return map;
}

/*
 * TODO function
 * Function: invertMap
 * Usage: map<string> inverse = invertMap(map);
 * --------------------------------------------
 * Creates an inverted copy of the specified map in which the values
 * in the original become the keys of the new map and refer back to
 * their associated keys.  Thus, if "abc" is bound to "xyz" in the
 * original map, the inverted map will bind "xyz" to "abc".  If two
 * keys in the original map have the same value, this function will
 * signal an error condition.
 */

map<string,string> invertMap(const map<string,string> & m) {
   // TODO
   map<string,string> m1;
   m1 = createMorseCodeMap();
   map<string,string> m2;
   //我们打算按照不处理最后一句话做，暂时不考虑。
   for (map<string,string>::iterator it = m1.begin(); it!= m1.end(); it++)
   {
      m2.insert(pair<string,string>(it->second,it->first));
   }
   return m2;
}

int main() {
    /* A sample translator:
     *                     > SOS
     *                     ... --- ...
     *                     > ... --- ...
     *                     SOS
     */
    string line;
    
    while (getline(cin, line) && line.length() > 0) {
    line = toUpperCase(line);
       if (line[0] == '.' || line[0] == '-') {
           cout << translateMorseToLetters(line) << endl;
       } else {
           cout << translateLettersToMorse(line) << endl;
       }
    }
    return 0;
}