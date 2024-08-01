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
using namespace std;

/*
 * TODO function
 * Function: translateLettersToMorse
 * Usage: string morse = translateLettersToMorse(line);
 * ----------------------------------------------------
 * Translates a string of letters into Morse Code characters separated
 * by spaces.  Characters that don't appear in the table are simply ignored.
 */

string translateLettersToMorse(string line)
{
   // TODO
   string final_string;
   map<string, string> map_morse = createMorseCodeMap();
   for (int i = 0; i < line.length(); i++)
   {
      string tmp_string;
      tmp_string.append(line.substr(i, 1));
      string morse = map_morse[tmp_string];
      final_string.append(morse + ' ');
   }
   return final_string;
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

string translateMorseToLetters(string line)
{
   // TODO
   int i = 0;
   map<string, string> map_morse = createMorseCodeMap();
   map<string, string> inverse = invertMap(map_morse);
   string final_string; 
   string tmp_string;
   int where_space;
   while (i < line.length())
   {
      where_space = line.find(' ', i);
      if (where_space == -1)
      {
         int index = line.length() - i;
         tmp_string = line.substr(i, index);
         final_string.append(inverse[tmp_string]);
         break;
      }
      int index = where_space - i;
      tmp_string = line.substr(i, index);
      i = where_space + 1;
      final_string.append(inverse[tmp_string]);
   }
   return final_string;
}

// for (int i = 0; i < line.length(); i++)
// {

//    if (line[i] != ' ')
//    {
//       tmp_string.push_back(line[i]);
//    }
//    else
//    {
//       string ch = inverse[tmp_string];
//       final_string.append(ch);
//       final_string.push_back(' ');
//       string tmp_string;
//    }
//}

/*
 * Function: createMorseCodeMap
 * Usage: map<string> map = createMorseCodeMap();
 * ----------------------------------------------
 * Returns a map in which each uppercase letter is mapped into its
 * Morse code equivalent.
 */

map<string, string> createMorseCodeMap()
{
   map<string, string> map;
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
 * map<string, string> invertMap(const map<string, string> &m)
{
   // TODO
   map<string, string> inverse;
   map<string, string>::iterator iter;
   while (iter != m.end())
   {
      string temp1 = iter->first;
      string temp2 = iter->second;
      inverse.insert(map<string, string>::value_type(temp2, temp1));
      iter++;
   }
   return inverse;
 */

map<string, string> invertMap(const map<string, string> &m)
{
   map<string, string> inverse;
   for (auto &t : m)
   {
      string m1 = t.first;
      string m2 = t.second;
      inverse[m2] = m1;
   }
   return inverse;
}

int main()
{
   /* A sample translator:
    *                     > SOS
    *                     ... --- ...
    *                     > ... --- ...
    *                     SOS
    */
   string line;

   while (getline(cin, line) && line.length() > 0)
   {
      //line = toUpperCase(line);
      if (line[0] == '.' || line[0] == '-')
      {
         cout << translateMorseToLetters(line) << endl;
      }
      else
      {
         cout << translateLettersToMorse(line) << endl;
      }
   }
   return 0;
}