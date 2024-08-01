
/* Q2:
 * File: ReverseQueue.cpp
 * ----------------------
 * This file tests the ReverseQueue function.
 */

#include <iostream>
#include "csc300222fall/assignment2/reversequeue.h"
#include <stack>
using namespace std;

/* TODO PART:
 * Function: reverseQueue
 * Usage: reverseQueue(queue);
 * ---------------------------
 * Reverses the order of the elements in a queue.  This
 * implementation does so by using a stack to hold the//用栈实现反转
 * values as they are being reversed.
 */

void reverseQueue(queue<string> & queue) {
   // TODO
   stack<string> rev;
   int len1 = queue.size();
    for (int i=0; i< len1;i++) {
        rev.push(queue.front());
        queue.pop();
    }
    int len2 = rev.size();
    for (int i=0; i< len2;i++) {
        queue.push(rev.top());
        rev.pop();
    }
}

/* TODO PART:
 * Function: listQueue
 * Usage: listQueue(queue);
 * ------------------------
 * Lists the contents of the queue on the standard output stream.
 */

void listQueue(queue<string> & queue) {
   // TODO
    int len = queue.size();
    cout<<"\nThe queue contains:";
    for (int i=0; i< len;i++) {
        cout<<" "<<queue.front();
        queue.push(queue.front());
        queue.pop();
    }

}

/* DO NOT modify this main() part*/

int main() {
    string str;
    queue<string> line;

    while(cin>>str){
        line.push(str);
    }
    listQueue(line);
    reverseQueue(line);
    listQueue(line);
    return 0;
}
