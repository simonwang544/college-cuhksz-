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
char a[100],b[100];
void removeComments(istream & is, ostream & os) {
   //TODO
   is.getline(a,1000,EOF);
   int key=0;
   int k=0;//k为b的计数器
   for(int i=0;a[i]!='\0';i++){
        if(key==2&&a[i]=='\n'){key=0;b[k]=a[i];k++;continue;}
        if(a[i]=='/'&&a[i+1]=='*')key=1;
        if(key==0 && a[i]=='/'&&a[i+1]=='/'){key=2;}
        if(key==0){b[k]=a[i];k++;}
        if(a[i]=='/'&&a[i-1]=='*')key=0;
   }
   b[k]='\0';
   os<<b;
}

void TestRemoveComments(){
    removeComments(cin, cout);
}

// DO NOT modify the main() function
/*
 * sample output format:
 //* input:  test file /* this is also a comment*/ /*test file // this is a comment
/* output: test file
           test file
 */
int main(int argc, char* argv[]) {
    TestRemoveComments();
    return 0;
}
