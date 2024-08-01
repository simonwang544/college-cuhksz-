/*
 * File: TokenScannerTest.cpp
 * --------------------------
 * This program tests the simple version of the TokenScanner class.
 */

#include <iostream>
#include <string>
#include "tokenscanner.h"
using namespace std;

/* Main program */

int main()
{
    cout << "Test program for the TokenScanner class" << endl;
    TokenScanner scanner;

    /* Try comment this line! */
    scanner.ignoreWhitespace();

    while (true) {
        cout << "Input line: ";
        string line;
        getline(cin, line);
        if (line.length() == 0) {
           break;
        }
        scanner.setInput(line);
        while (scanner.hasMoreTokens()) {
           cout << " \"" << scanner.nextToken() << "\"" << endl;
        }
        cout << endl;
   }
   return 0;
}
