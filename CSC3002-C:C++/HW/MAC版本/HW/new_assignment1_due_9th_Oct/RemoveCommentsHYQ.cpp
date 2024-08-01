#include <iostream>
#include <iomanip>
#include "csc300222fall/assignment1/RemoveComments.h" //for OJ
using namespace std;

#pragma GCC diagnostic ignored "-Wcomment"
/*
 * Function: removeComments
 * Usage: removeComments(str, os);
 * ------------------------------
 * Copies characters from the input stream str to the output stream os,
 * removing any comments it finds.  Thstr program eliminates both the
 * /* and // comment forms but does not check to see if those characters
 * are embedded within strings.
 */

void removeComments(istream & is, ostream & os) {
   string str;
   string newl;
   while (getline(cin, newl, '\0')){
              str.append(newl);
       }

   while ((str.find("/*") != -1) && (str.find("*/") != -1)) {
    if (int(str.find("/*")) < int(str.find("*/")))
    {
        str.erase(int(str.find("/*")), int(str.find("*/")) - int(str.find("/*")) + 1);
    }
    else
    {
      int pos2_1 = str.find("*/", int(str.find("/*")) + 2);
      int len2 = pos2_1 - str.find("/*") + 1;
      str.erase(int(str.find("/*")), len2 + 1);
    }
      
    }
   
   while (int(str.find("//")) != -1) 
   {
    int pos1 = str.find("//");
    int pos1_1 = str.find('\n', pos1 + 2);
    int len =  pos1_1 - pos1;
    str.erase(pos1, len);
   }
   cout << str << endl;

}

void TestRemoveComments(){
    removeComments(cin, cout);
}

// DO NOT modify the main() function
int main(int argc, char* argv[]) {
    TestRemoveComments();
    return 0;
}