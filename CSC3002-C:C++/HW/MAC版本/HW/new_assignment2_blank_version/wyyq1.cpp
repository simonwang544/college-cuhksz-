/* Q1:
 * File: calendar.cpp
 * ------------------
 * This file implements the calendar.h interface
 */

#include <string>
#include <iostream>
#include "csc300222fall/assignment2/lib.h"
#include "csc300222fall/assignment2/calendar.h"

using namespace std;

Month stringToMonth(string s)
{
   if (s == "JANUARY") {
      return JANUARY;
   }
   if (s == "FEBRUARY") {
      return FEBRUARY;
   }
   if (s == "MARCH") {
      return MARCH;
   }
   if (s == "APRIL") {
      return APRIL;
   }
   if (s == "MAY") {
      return MAY;
   }
   if (s == "JUNE") {
      return JUNE;
   }
   if (s == "JULY") {
      return JULY;
   }
   if (s == "AUGUST") {
      return AUGUST;
   }
   if (s == "SEPTEMBER") {
      return SEPTEMBER;
   }
   if (s == "OCTOBER") {
      return OCTOBER;
   }
   if (s == "NOVEMBER") {
      return NOVEMBER;
   }
   if (s == "DECEMBER") {
      return DECEMBER;
   }
}

/* TODO PART:
 * Implementation notes: monthToString
 * -----------------------------------
 * The monthToString function must return some value if the month does not
 * match any of the enumeration constants.  Here, as in the Direction
 * type, the function returns ???.
 */
string monthToString(Month month)
{
   // TODO
   if (month == 1) {
      return "JANUARY";
   }
   else if (month == 2) {
      return "FEBRUARY";
   }
   else if (month == 3) {
      return "MARCH";
   }
   else if (month == 4) {
      return "APRIL";
   }
   else if (month == 5) {
      return "MAY";
   }
   else if (month == 6) {
      return "JUNE";
   }
   else if (month == 7) {
      return "JULY";
   }
   else if (month == 8) {
      return "AUGUST";
   }
   else if (month == 9) {
      return "SEPTEMBER";
   }
   else if (month == 10) {
      return "OCTOBER";
   }
   else if (month == 11) {
      return "NOVEMBER";
   }
   else if (month == 12) {
      return "DECEMBER";
   }
   else {
      return "???";
   }
   return NULL;
}

Month operator++(Month &month, int)//会无限循环吗//需要default吗
{
   // TODO
   switch(month)
   {
      case 1:
         return FEBRUARY;
         break;
      case 2:
         return MARCH;
         break;
      case 3:
         return APRIL;
         break;
      case 4:
         return MAY;
         break;
      case 5:
         return JUNE;
         break;
      case 6:
         return JULY;
         break;
      case 7:
         return AUGUST;
         break;
      case 8:
         return SEPTEMBER;
         break;
      case 9:
         return OCTOBER;
         break;
      case 10:
         return NOVEMBER;
         break;
      case 11:
         return DECEMBER;
         break;
      case 12:
         return JANUARY;
         break;
   }
}


/*
 * Implementation notes: Constructors
 * ----------------------------------
 * There are three constructors for the Date class.  The defaultDate类有三个构造函数。默认构造函数创建一个内部值为零的Date，在使用它之前必须为它赋一个新值。其他的则通过调用私有initDate方法从参数初始化日期。
 * constructor creates a Date with a zero internal value that must
 * be assigned a new value before it is used.  The others initialize
 * the date from the arguments by calling the private initDate method.
 */

Date::Date()
{
   initDate(1, JANUARY, 1900);
}

Date::Date(int day, Month month, int year)
{
   initDate(day, month, year);
}

Date::Date(Month month, int day, int year)
{
   initDate(day, month, year);
}

/*
 * TODO function
 * Implementation notes: getDay, getMonth
 * --------------------------------------
 * In this implementation of the Date class, the day and the month are
 * not stored explicitly but must instead be computed from the dayInYear
 * field.
 */

int Date::getDay()
{
   // TODO
   return day;
}

/*
 * TODO function
 * Method: getMonth
 * Usage: Month month = date.getMonth();
 * -------------------------------------
 * Returns the month.
 */

Month Date::getMonth()
{
   // TODO   
   return month;
}

int Date::getYear()
{
   // TODO
   if (year<1000||year >10000){
      return 0;
   }else{
      return year;
   }
   //return year;
}

/*
 * TODO function
 * Implementation notes: toString
 * ------------------------------
 * The toString method uses the getters to perform the translation into
 * day/month/year values.
 */

string Date::toString()
{
   // TODO
   string dd = to_string(day);
   string mmm = capitalize(monthToString(month));
   string yyyy = to_string(year);
   string finalDate = dd+'-'+ mmm +'-'+ yyyy;
   return finalDate;
   
}

string Date::capitalize(string str)
{
   // TODO
   str = str.substr(0,3);
   for(int i=1; i < 3; i++) {
      str[i]+=32;
   }
   return str;
}

void Date::initDate(int day, Month month, int yyyy)
{
   // TODO
   this-> day = day;
   this -> month = month;
   this -> year = yyyy;

   //return ;

}

Date operator+(Date date, int delta)
{
   // TODO
   int array[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
   date.dayInYear = 0;
   for (int i = 0;i < date.month-1;i++) {//注意下标从0开始
      date.dayInYear += array[i];
   }
   if (isLeapYear(date.year)){
      if (date.month - 1>1){
         date.dayInYear += date.day+1;
      }else{
         date.dayInYear +=date.day;
      }
   }else{
      date.dayInYear +=date.day;
   }
   date.dayInYear += delta;
   int year_use = date.dayInYear;
   if (isLeapYear(date.year)) {
      array[1] = 29;
   }
   date.month = JANUARY;
   int h = 0;
   while(true){
      if (date.dayInYear<=array[h]){
         date.day = date.dayInYear;
         break;
      }else {
         date.month = date.month++;
         date.dayInYear -= array[h];
         h++;
      }
      if (h ==11){
         h = 0;
      }
   }
   while(true){
      //先要考虑这是不是闰年
      //再加天数
      int tian;
      if(isLeapYear(date.year)){
         tian = 366;
      }else{
         tian = 365;
      }
      if (year_use <= tian){
         return date;
      }else{
         year_use -= tian;
         date.year +=1;
      }
      
   }   
}

Date operator-(Date date, int delta)
{
   // TODO
   delta = -1*delta;
   date = date +delta;
   return date;
}

int operator-(Date d1, Date d2)
{
   // TODO
   //算得是两个日期在那一年从1.1开始的天数
   int m = 0;
   int array[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
   d1.dayInYear = 0;
   d2.dayInYear = 0;
   for (int i = 0;i < d1.month-1;i++) {//注意下标从0开始
      d1.dayInYear += array[i];
   }
   if (isLeapYear(d1.year)){
      if (d1.month - 1>1){
         d1.dayInYear += d1.day+1;
      }else{
         d1.dayInYear +=d1.day;
      }
   }else{
      d1.dayInYear +=d1.day;
   }
   for (int j = 0;j < d2.month-1;j++) {//注意下标从0开始
      d2.dayInYear += array[j];
   }
   if (isLeapYear(d2.year)){
      if (d2.month - 1>1){
         d2.dayInYear += d2.day+1;
      }else{
         d2.dayInYear +=d2.day;
      }
   }else{
      d2.dayInYear +=d2.day;
   }
   if(d1.year == d2.year){
      if (d1.dayInYear>d2.dayInYear){
         m = d1.dayInYear-d2.dayInYear;
      }else{
         m = d2.dayInYear-d1.dayInYear;
      }
      
      return m;
   }else if (d1.year <d2.year){
      for (int k = 0; k<(d2.year-d1.year);k++){
         if (isLeapYear(d1.year+k)){
            m +=366;
         }else{
         m +=365;
         }
      }
      m = m+d2.dayInYear-d1.dayInYear;
      return m;
      //return -m;
   }else{
      for (int k = 0; k<(d1.year-d2.year);k++){
         if (isLeapYear(d2.year+k)){
            m +=366;
         }else{
         m +=365;
         }
      }
      m = m+d1.dayInYear-d2.dayInYear;
      return m;
   }
}

Date &operator+=(Date &date, int delta)
{
   // TODO
   Date a = date + delta;
   return a;
}

Date &operator-=(Date &date, int delta)
{
   // TODO
   Date a = date - delta;
   return a;
}

Date operator++(Date &date)
{
   // TODO
   Date a = date + 1;
   return a;
}

Date operator++(Date &date, int)
{
   // TODO
   Date date1 = date;
   date = date + 1;
   return date1;
   
}

Date operator--(Date &date)
{
   // TODO
   Date b = date - 1;
   return b;
}

Date operator--(Date &date, int)
{
   // TODO
   Date date2 = date;
   date = date - 1;
   return date2;
}

bool operator==(Date d1, Date d2)
{
   // TODO
   return (d1-d2 == 0);

}

bool operator!=(Date d1, Date d2)
{
   // TODO
   return (d1-d2 != 0);
}

bool operator<(Date d1, Date d2)
{
   // TODO
   //cout<<d1-d2<<endl;
   int m = 0;
   int array[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
   int d1dayinyear = 0;
   int d2dayinyear = 0;
   for (int i = 0;i < d1.getMonth()-1;i++) {//注意下标从0开始
      d1dayinyear += array[i];
   }
   if (isLeapYear(d1.getYear())){
      if (d1.getMonth() - 1>1){
         d1dayinyear += d1.getDay()+1;
      }else{
         d1dayinyear +=d1.getDay();
      }
   }else{
      d1dayinyear +=d1.getDay();
   }
   for (int j = 0;j < d2.getMonth()-1;j++) {//注意下标从0开始
      d2dayinyear += array[j];
   }
   if (isLeapYear(d2.getYear())){
      if (d2.getMonth() - 1>1){
         d2dayinyear += d2.getDay()+1;
      }else{
         d2dayinyear +=d2.getDay();
      }
   }else{
      d2dayinyear +=d2.getDay();
   }
   if(d1.getYear() == d2.getYear()){
      if (d1dayinyear<=d2dayinyear){
         return false;
      }else{
         return true;
      }
   }else if (d1.getYear() <d2.getYear()){
      return true;
   }else{
      return false;
   }
   //return (d1-d2 <0);
}

bool operator<=(Date d1, Date d2)
{
   // TODO
   int m = 0;
   int array[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
   int d1dayinyear = 0;
   int d2dayinyear = 0;
   for (int i = 0;i < d1.getMonth()-1;i++) {//注意下标从0开始
      d1dayinyear += array[i];
   }
   if (isLeapYear(d1.getYear())){
      if (d1.getMonth() - 1>1){
         d1dayinyear += d1.getDay()+1;
      }else{
         d1dayinyear +=d1.getDay();
      }
   }else{
      d1dayinyear +=d1.getDay();
   }
   for (int j = 0;j < d2.getMonth()-1;j++) {//注意下标从0开始
      d2dayinyear += array[j];
   }
   if (isLeapYear(d2.getYear())){
      if (d2.getMonth() - 1>1){
         d2dayinyear += d2.getDay()+1;
      }else{
         d2dayinyear +=d2.getDay();
      }
   }else{
      d2dayinyear +=d2.getDay();
   }
   if(d1.getYear() == d2.getYear()){
      if (d1dayinyear<=d2dayinyear){
         return true;
      }else{
         return false;
      }
   }else if (d1.getYear() < d2.getYear()){
      return true;
   }else{
      return false;
   }
   //return (d1-d2 <=0);
}

bool operator>(Date d1, Date d2)
{
   // TODO
   return (!operator<(d1, d2));
   //return (d1-d2 >0);
}

bool operator>=(Date d1, Date d2)
{
   // TODO
   return (!operator<=(d1, d2));
   //return (d1-d2 >=0);
}

std::ostream &operator<<(std::ostream &os, Date date){
   // TODO
   string mon = (monthToString(date.getMonth()));
   mon = mon.substr(0,3);
   for(int i=1; i < 3; i++) {
      mon[i]+=32;
   }
   os<<date.getDay()<<"-"<<mon<<"-"<<date.getYear();
   return os;
}

/*
 * TODO function
 * Implementation notes: daysInMonth
 * ---------------------------------
 * This function is a reasonably literal translation of the old rhyme:
 *
 *    Thirty days has September
 *    April, June, and November
 *    All the rest have 31
 *    Excepting February alone
 *    Which has 28 in fine
 *    And each leap year 29
 */

int daysInMonth(Month month, int year)
{
   // TODO
   if (month == FEBRUARY ) {
      if (isLeapYear(year)) {
         return 29;
      }else {
         return 28;
      }
   }else if (month == JANUARY|| month ==MARCH|| month ==MAY|| month ==JULY|| month ==AUGUST|| month ==OCTOBER|| month ==DECEMBER){//如果不加month为什么不行
      return 31;
   }else{
      return 30;
   
   }
   return 0;
}

/* TODO PART:
 * Implementation notes: isLeapYear
 * --------------------------------
 * This function simply encodes the rule for determining leap years:
 * a leap year is any year divisible by 4, except for years ending in 00,
 * in which case the year must be divisible by 400.
 */

bool isLeapYear(int year)
{
   // TODO
   if (year % 100 == 0) {
      if (year % 400 == 0) {
         return true;
      }else {
         return false;
      }
   }else {
      if (year % 4 == 0) {
         return true;
      }else {
         return false;
      }
   }
}

/* DO NOT modify this main() part */
int main()
{
   int id;
   cin >> id;
   int day, year;
   string mon;
   cin >> day >> mon >> year;

   if (id == 1)
   {
      for (Month month = JANUARY; month <= DECEMBER; month = Month(month + 1))
      {
         cout << monthToString(month) << " has " << daysInMonth(month, year)
              << " days." << endl;
      }
   }
   else if (id == 2)
   {
      Date moonLanding(day, stringToMonth(mon), year);
      cout << "moonLanding = " << moonLanding.toString() << endl;
   }
   else if (id == 3)
   {
      Date moonLanding(day, stringToMonth(mon), year);
      cin >> mon >> day >> year;
      Date kennedyAssassination(stringToMonth(mon), day, year);
      cin >> mon >> day >> year;
      Date newYearsEve(stringToMonth(mon), day, year);
      cin >> day >> mon >> year;
      Date inaugurationDay(day, stringToMonth(mon), year);
      cin >> day >> mon >> year;
      Date electionDay(day, stringToMonth(mon), year);
      cout << "moonLanding = " << moonLanding << endl;
      cout << "kennedyAssassination = " << kennedyAssassination << endl;
      cout << boolalpha;
      cout << "moonLanding < kennedyAssassination = "
           << (moonLanding < kennedyAssassination) << endl;
      cout << "moonLanding > kennedyAssassination = "
           << (moonLanding > kennedyAssassination) << endl;
      cout << "moonLanding == kennedyAssassination = "
           << (moonLanding == kennedyAssassination) << endl;
      cout << "moonLanding == moonLanding = "
           << (moonLanding == moonLanding) << endl;
      cout << "inaugurationDay - electionDay = "
           << (inaugurationDay - electionDay) << endl;
      Date day = newYearsEve;
      cout << "New Year's Eve = " << day++ << endl;
      cout << "New Year's Day = " << day << endl;
      for (Date d = electionDay; d <= inaugurationDay; d++)
      {
         cout << d << endl;
      }
   }
}
