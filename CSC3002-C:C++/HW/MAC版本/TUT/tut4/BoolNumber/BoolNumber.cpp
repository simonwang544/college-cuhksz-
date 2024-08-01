/**
 * @file BoolNumber.cpp
 * @author I-am-Future
 * @brief Demo for CSC3002, tutorial 5
 * @version 0.1
 * @date 2022-10-10
 */

#include <iostream>
#include <algorithm>
#include <ostream>

class BoolNumber{
public:
    // constructor, assign value 0 / 1 to the instance
    BoolNumber(int v){ 
        if (v == 0 || v == 1)
            value = v; 
            return;
        // raise error if v is not 0 / 1
        throw std::invalid_argument("v can only be 0 or 1!!!");
    }
    // default constructor, assign 0 to the instance
    BoolNumber(){ BoolNumber(0); }
    
    // member function for negative sign.
    BoolNumber operator-();

    // overload these functions as friend member function, because we'll visit the private field
    friend BoolNumber operator+(BoolNumber& lhs, BoolNumber& rhs);

    friend BoolNumber operator*(BoolNumber& lhs, BoolNumber& rhs);

    friend std::ostream& operator<<(std::ostream& os, BoolNumber rhs);

private: 
    int value;
};

/*
 * this function is a member function.
 * Inverse (negative) the current BoolNumber.
 * Truth table:
 *  lhs  = ans
 *   0      0
 *   1      1
 */
BoolNumber BoolNumber::operator-(){
    BoolNumber ans(1 - value);
    return ans;
}

/*
 * friend functions are free function.
 * Boolean Add between two BoolNumber.
 * Truth table:
 *  lhs + rhs = ans
 *   0     0     0
 *   0     1     1
 *   1     0     1
 *   1     1     1
 */
BoolNumber operator+(BoolNumber& lhs, BoolNumber& rhs){
    BoolNumber ans(std::min(1, lhs.value+rhs.value));
    return ans;
}

/*
 * friend functions are free function.
 * Boolean Add between two BoolNumber.
 * Truth table:
 *  lhs * rhs = ans
 *   0     0     0
 *   0     1     0
 *   1     0     0
 *   1     1     1
 */
BoolNumber operator*(BoolNumber& lhs, BoolNumber& rhs){
    BoolNumber ans(lhs.value*rhs.value);
    return ans;
}


std::ostream& operator<<(std::ostream& os, BoolNumber rhs){
    os << rhs.value;
    return os;
}

// free function
void operator+(BoolNumber& lhs, int a){
    std::cout << "We don't support \"+\" between BoolNumber and int!!!";
}

int main(){
    /* testing */
    BoolNumber A(1);
    BoolNumber B(0);

    // print out A's value: 1
    std::cout << A << std::endl;

    // print -A(1) answer: 0
    std::cout << (-A) << std::endl;

    // print -B(0) answer: 1
    std::cout << (-B) << std::endl;

    // print A(1) + B(0) answer: 1
    std::cout << (A + B) << std::endl;

    // print A(1) * B(0) answer: 0
    std::cout << (A * B) << std::endl;

    // test if we add BoolNumber with an int?
    A + 1;

    return 0;
}