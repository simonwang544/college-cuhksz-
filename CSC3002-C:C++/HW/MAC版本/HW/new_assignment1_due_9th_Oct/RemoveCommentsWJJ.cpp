/*
 * File: RemoveComments.cpp
 * ------------------------
 * Prints out a file after removing comments.
 */
// header file for local test
#include <iostream>
#include <iomanip>
#include "csc300222fall/assignment1/RemoveComments.h" //for OJ



using namespace std;

#pragma GCC diagnostic ignored "-Wcomment"
/*
 * Function: removeComments
 * Usage: removeComments(is, os);
 * ------------------------------
 * Copies characters from the input stream is to the output stream os,
 * removing any comments it finds.  This program eliminates both the
 * /* and // comment forms but does not check to see if those characters
 * are embedded within strings.
 */
void removeComments(istream & is, ostream & os) {
   //TODO
   string lines;
   string new_lines; 
   while(getline(is,lines,'\0'))
   {
        new_lines.append(lines);
   }
   while(int(new_lines.find("/*")) != -1  &&   int(new_lines.find("*/")) != -1)
   {
        if (int(new_lines.find("/*")) < int(new_lines.find("*/")))
        {
            new_lines.erase(int(new_lines.find("/*")),int(new_lines.find("*/"))-int(new_lines.find("/*")+2));
        }
        else
        {
            int pos = new_lines.find("*/",int(new_lines.find("/*")+1));
            new_lines.erase(int(new_lines.find("/*")), pos -int(new_lines.find("/*")+2));
        }
   }
   while(int(new_lines.find("//")) != -1)
   {
    new_lines.erase(int(new_lines.find("//")),new_lines.find('\n') -int(new_lines.find("//")));
   }
   os << new_lines << endl;

}

void TestRemoveComments(){
    removeComments(cin, cout);
}

// DO NOT modify the main() function
/*
 * sample output format:
 * input:  test file // this is a comment
           test file /* this is also a commen
           shahdo t*/
/* output: test file
           test file
 */
int main(int argc, char* argv[]) {
    TestRemoveComments();
    return 0;
}