/*
 * File: Traverse.cpp
 * ------------------
 * This program reimplements the breadth-first search using an
 * explicit queue, and depth-first search algorithm using an explicit stack
 */

#include <iostream>
#include <fstream>
#include <string>
#include <set>
#include <stack>
#include <queue>
#include "csc300222fall/assignment5/simplegraph.h"
using namespace std;

void bfs(Node *start) {
   set<Node *> vi;
   queue<Node *> que;
   que.push(start);
   while (!que.empty()) {
      start = que.front();
      que.pop();
      if (vi.find(start) == vi.end()) {
         cout << start->name << endl;
         vi.insert(start);
         for (Arc *arc : start->arcs) {
            que.push(arc->finish);
         }
      }
   }
   
      
}

void dfs(Node *start) {
   stack<Node *> str;
   set<Node *> vi;
   Node *next;
   str.push(start);
   while (!str.empty()) {
      next = str.top();
      str.pop();
      if (vi.find(next) == vi.end()) {
        cout << next->name << endl;
        vi.insert(next);}
      for (Arc *arc : next->arcs) {
         if (vi.find(arc->finish) == vi.end()) {
            str.push(arc->finish);}
      }
   }
}

int main(){
   SimpleGraph airline;
   readGraph(airline, cin);
   cout << "DFS at Portland ...." << endl;
   dfs(airline.nodeMap.at("Portland"));
   cout << "BFS at Portland ...." << endl;
   bfs(airline.nodeMap.at("Portland"));
   return 0;
}