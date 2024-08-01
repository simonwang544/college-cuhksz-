
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
 * implementation does so by using a stack to hold the
 * values as they are being reversed.
 */

void reverseQueue(queue<string> & queue) {
   // TODO
   stack<string>s;
   int queue_length = queue.size();
   cout << queue_length<<endl;
   int p =1;
   while(p <= queue_length)//对整体操作
   {
    s.push(queue.front());
        if(queue.front() != " ")//以每一个单词为单位,把他们放到stack里倒置；
        {
            queue.pop();
            if (p = queue_length)
            {
                queue.push(" ");
                while(!s.empty())
                {
                queue.push(s.top());
                s.pop();
                }
                break;
            }
        }
        else
        {
            while(!s.empty())
            {
            queue.push(s.top());
            s.pop();
            }
        }   
    p = p+1; 
   }
   cout << queue_length<<endl;
   int j = 1;
   queue.pop();
   while( j <= queue_length)
   {
    s.push(queue.front());
    queue.pop();
    j = j+1;
   }
   while (!s.empty())
   {
    queue.push(s.top());
    s.pop();
   }
    cout << queue_length<<endl;
}

/* TODO PART:
 * Function: listQueue
 * Usage: listQueue(queue);
 * ------------------------
 * Lists the contents of the queue on the standard output stream.
 */

void listQueue(queue<string> & queue) {
   // TODO
   int queue_length = queue.size();
   int i =1;
   cout << "The queue contains: ";
   while(i <= queue_length)
   {
    if(i == queue_length)
    {
        cout << queue.front()<< endl ;
    }
    else
    {
        cout << queue.front()<< " ";
    }
    //string temp1 = queue.front();
    queue.push(queue.front());
    queue.pop();
    i = i+1;
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
