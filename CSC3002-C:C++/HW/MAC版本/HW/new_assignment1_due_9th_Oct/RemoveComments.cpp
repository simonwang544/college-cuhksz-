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
    string line;
    string new_line;
    while (getline(is,line)) 
    { 
        new_line.append(line);
        new_line +="\n";
        int num1 = new_line.find("/*");
        int num2 =  new_line.find("*/");
        if(num1 !=-1  && num2 !=-1) 
        {
            new_line.replace(num1,num2-num1+2,"");
        }
        int num3 = new_line.find("//");
        if (num3 != -1)
        {
            new_line = new_line.substr(0,num3);
            new_line += "\n";
        }
    }
    int num4 = new_line.length();
    new_line = new_line.substr(0,num4);
    os << new_line;
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