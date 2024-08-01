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
    string wholeString;
    while (getline(is,line)) { //一行一行的读


    if (int(wholeString.find("/*")) !=-1  && int(wholeString.find("*/")) !=-1 && wholeString.find("/*") < wholeString.find("*/")) {
            wholeString = wholeString.replace(wholeString.find("/*"),wholeString.find("*/")-wholeString.find("/*")+2,"");
            
                if (wholeString.length()-wholeString.find("*/")+2 != 0) {
                    while (true) {
                        if (int(wholeString.find("/*")) !=-1  && int(wholeString.find("*/")) !=-1 && wholeString.find("/*") < wholeString.find("*/")) {
                            wholeString = wholeString.replace(wholeString.find("/*"),wholeString.find("*/")-wholeString.find("/*")+2,"");
                        }else {
                            break;
                        }
                    }
                }
            
        }
    
        wholeString = wholeString + line +"\n";
        if (int(wholeString.find("//")) != -1) {
            wholeString = wholeString.replace(wholeString.find("//"),wholeString.length()-wholeString.find("//")+2,"\n");

        }
        
        
    }
    wholeString = wholeString.substr(0,wholeString.length()-1);
    os << wholeString;
}

void TestRemoveComments(){
    removeComments(cin, cout);
}

// DO NOT modify the main() function
/*
 * sample output format:
 * input:  test file // this is a comment
           test file /* this is also a comment*/
/* output: test file
           test file
 */
int main(int argc, char* argv[]) {
    TestRemoveComments();
    return 0;
}