#include <iostream>
#include <string>
using namespace std;
int main(){
    char name1[] = "ray";
    string name2 = "ray";
    cout<<"hello,"<<name1<<endl;
    cout<<"hello,"<<name2<<endl;
    cout<<"hello," + name1<<endl;
    cout<<"hello," + name2<<endl;
    return 0;
}