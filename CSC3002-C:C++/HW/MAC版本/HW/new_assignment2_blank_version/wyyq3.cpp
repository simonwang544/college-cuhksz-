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
 * Translates a string of letters into Morse Code characters separated将字符串转换为由空格分隔的莫尔斯电码字符。没有出现在表中的字符将被忽略。
 * by spaces.  Characters that don't appear in the table are simply ignored.
 */

string translateLettersToMorse(string line) {
   // TODO
   string line2;
   std::map<string, string> map = createMorseCodeMap();
   //std::map<string, string>::iterator iter;  //问题记录：为什么显示不能使用类型名(在没有添加std：：之前)
   for (int i=0; i<=line.length()-1; i++) {
      if (line[i] >='A' && line[i] <= 'Z' ){
         string ch = line.substr(i,1);
         line2.append(map[ch]+" ");
      }
   }
   return line2;
   
}

/*
 * TODO function
 * Function: translateMorseToLetters
 * Usage: string letters = translateLettersToMorse(line);
 * ------------------------------------------------------
 * Translates a string in Morse Code into English letters.将莫尔斯电码中的字符串翻译成英文字母。因为断字不以莫尔斯电码表示，所以输出中的字母将一起运行。莫尔斯电码输入的字符必须用一个空格隔开。输入中的任何其他字符都将被忽略。如果英文中没有摩尔斯码字符的对应字符，该函数通过插入一个问号(?)来表示事实。实现注意:为了消除行中最后一个字符的特殊情况，该函数首先在输入字符串的末尾添加一个空格。
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
   string line3;
   string line4;
   std::map<string, string> map = createMorseCodeMap();
   std::map<string, string> inverse = invertMap(map);
   int start = 0;
   for (int k = 0; k<line.length();k++){
      if (line[k] == '.'|| line[k] =='-'|| line[k] ==' '){
         string a = line.substr(k,1);
         line4.append(a);
      }
   }
   cout<<line4<<endl;
   string line5;
   bool isfirstspace = false;
   for (int j = 0; j<line4.length();j++){
      if(line4[j]== ' '){
         if(!isfirstspace){
            string b = line4.substr(j,1);
            line5.append(b);
            isfirstspace = true;
         }
      }else{
            string b = line4.substr(j,1);
            line5.append(b);
            isfirstspace = false;
      }
   }
   if (line5[line5.length()-1]==' '){
      line5 = line5.substr(0,line5.length()-1);
   }
   // int q1 = line4.length();
   // for (int j = 0; j<q1-1;j++){
   //    if(line4[j]== ' '&& line4[j+1] == ' '){
   //       line4.replace(line4[j],1,"");
   //       j--;
   //       //q1--;
   //    }
   // }
   cout<<line5<<endl;
   line5.append(" ");
   //int q2 = line.length();
   for (int i = 0; i<line5.length();i++){
      if (line5[i] == ' '){
         string sub = line5.substr(start, i - start);
         // for (int j = 0; j<sub.length();j++){//忽略不相关的字符？
         //    if (sub[j] != '.'&& sub[j] != '-'){
         //       sub.erase(j,1);
         //    }
         //}
         if (inverse.count(sub)>0){
            line3.append(inverse[sub]);
         }else{
            //1.如果输出的时候多了一个空格是输出问号呢还是忽略2.如果输出的时候出现..s.是输出问号呢还是s 3.如果有除了.-出现是忽略呢还是？
            line3.append("?");
         }
         start = i + 1;
      }
   }

   return line3;
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
 * Creates an inverted copy of the specified map in which the values创建指定映射的反向副本，其中原始映射中的值成为新映射的键，并引用它们的关联键。因此，如果“abc”在原始映射中绑定到“xyz”，则倒置映射将“xyz”绑定到“abc”。如果原始映射中的两个键具有相同的值，该函数将发出错误条件的信号。
 * in the original become the keys of the new map and refer back to
 * their associated keys.  Thus, if "abc" is bound to "xyz" in the
 * original map, the inverted map will bind "xyz" to "abc".  If two
 * keys in the original map have the same value, this function will
 * signal an error condition.
 */

map<string,string> invertMap(const map<string,string> & m) {
   // TODO
   map<string,string> inverse;
   //int m1 = m.size();
   for (map<string, string>::const_iterator it = m.begin(); it != m.end(); it++)
	{
      inverse.insert(pair<string,string>(it->second,it->first));
	}
   return inverse;
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

