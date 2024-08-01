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
   switch (month)
   {
   case JANUARY:
      return "JANUARY";
      break;
   case FEBRUARY:
      return "FEBRUARY";
      break;
   case MARCH:
      return "MARCH";
      break;
   case APRIL:
      return "APRIL";
      break;
   case MAY:
      return "MAY";
      break;
   case JUNE:
      return "JUNE";
      break;
   case JULY:
      return "JULY";
      break;
   case AUGUST:
      return "AUGUST";
      break;
   case SEPTEMBER:
      return "SEPTEMBER";
      break;
   case OCTOBER:
      return "OCTOBER";
      break;
   case NOVEMBER:
      return "NOVEMBER";
      break;
   case DECEMBER:
      return "DECEMBER";
      break;
   default:
      return "???";
      break;
   }
}

Month operator++(Month &month, int)
{
   // TODO
   Month old_month = month;
   month = Month(old_month +1);
   return month;
}


/*
 * Implementation notes: Constructors
 * ----------------------------------
 * There are three constructors for the Date class.  The default
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
   int get_day =dayInYear;
   Month month = JANUARY;
   while(get_day > daysInMonth(month,year))
   {
    get_day = get_day - daysInMonth(month,year);
    month++;
   }
   return get_day;
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
   int get_day =dayInYear;
   Month month = JANUARY;
   while(get_day > daysInMonth(month,year))
   {
    get_day = get_day - daysInMonth(month,year);
    month++;
   }
   return month;
}

int Date::getYear()
{
   // TODO
   return year;
}

/*
 * TODO function
 * Implementation notes: toString
 * ------------------------------
 * The toString method uses the getters to perform the translation into
 * day-month-year values.
 */

string Date::toString()
{
   // TODO
   string print_string_2;
   switch(month)
   {
    case JANUARY:
        print_string_2 = integerToString(day)+"-" + capitalize(monthToString(month)) + "-"+ integerToString(year);
        break;
    case FEBRUARY:
      print_string_2 = integerToString(day)+"-" + capitalize(monthToString(month)) + "-"+ integerToString(year);
      break;
   case MARCH:
      print_string_2 = integerToString(day)+"-" + capitalize(monthToString(month)) + "-"+ integerToString(year);
      break;
   case APRIL:
      print_string_2 = integerToString(day)+"-" + capitalize(monthToString(month)) + "-"+ integerToString(year);
      break;
   case MAY:
      print_string_2 = integerToString(day)+"-" + capitalize(monthToString(month)) + "-"+ integerToString(year);
      break;
   case JUNE:
      print_string_2 = integerToString(day)+"-" + capitalize(monthToString(month)) + "-"+ integerToString(year);
      break;
   case JULY:
      print_string_2 = integerToString(day)+"-" + capitalize(monthToString(month)) + "-"+ integerToString(year);
      break;
   case AUGUST:
      print_string_2 = integerToString(day)+"-" + capitalize(monthToString(month)) + "-"+ integerToString(year);
      break;
   case SEPTEMBER:
      print_string_2 = integerToString(day)+"-" + capitalize(monthToString(month)) + "-"+ integerToString(year);
      break;
   case OCTOBER:
      print_string_2 = integerToString(day)+"-" + capitalize(monthToString(month)) + "-"+ integerToString(year);
      break;
   case NOVEMBER:
      print_string_2 = integerToString(day)+"-" + capitalize(monthToString(month)) + "-"+ integerToString(year);
      break;
   case DECEMBER:
      print_string_2 = integerToString(day)+"-" + capitalize(monthToString(month)) + "-"+ integerToString(year);
      break;
   }
   return print_string_2;
}

string Date::capitalize(string str)
{
   // TODO
   return toUpperCase(str.substr(0, 1)) + toLowerCase(str.substr(1,2));
}

void Date::initDate(int day, Month month, int yyyy)
{
   // TODO
   this->day = day;
   this->month = month;
   year = yyyy;
   dayInYear = day;
   Month monthtemp1 = JANUARY;
   while(monthtemp1 < month)
   {
    dayInYear =  dayInYear + daysInMonth(monthtemp1,year);
    monthtemp1++;
   }
}

Date operator+(Date date, int delta)
{
   // TODO
   int days = date.getDay();
   Month mon = date.getMonth();
   int year = date.getYear();
   days= days +delta;
   while(days>daysInMonth(mon,year))
   {
      days= days - daysInMonth(mon,year);
      mon++;
      if (mon >12)
      {
      year = year+1;
      mon = JANUARY;
      }
   }
   return Date(days,mon,year);
}

Date operator-(Date date, int delta)
{
   // TODO
   int days = date.getDay();
   Month mon = date.getMonth();
   int year = date.getYear();
   days= days -delta;
   while(days <= 0)
   {
      mon= Month(mon-1);
      if(mon <= 0)
      {
         year = year-1;
         mon = DECEMBER;
      }
      days= days + daysInMonth(mon,year);
   }
   return Date(days,mon,year);
}

int operator-(Date d1, Date d2)
{
   // TODO
   int i =1;
   while(d1 != d2)
   {
      if(d1== d2+i)
      {
         break;
      }
      else if ( d2 ==d1 +i )
      {
         break;
      }
      else
      {
         i= i+1;
      }
   }
   return i;
}

Date &operator+=(Date &date, int delta)
{
   // TODO
   date = date+delta;
   return date;
}

Date &operator-=(Date &date, int delta)
{
   // TODO
   date = date- delta;
   return date;
}

Date operator++(Date &date)
{
   // TODO
   date= date+1;
   return date;
}

Date operator++(Date &date, int)
{
   // TODOa
   Date old = date;
   date = date + 1;
   return old; 
}

Date operator--(Date &date)
{
   // TODO
   date = date-1;
   return date;
}

Date operator--(Date &date, int)
{
   // TODO
   Date old = date;
   date =date-  1;
   return old;
}

bool operator==(Date d1, Date d2)
{
   // TODO
   if(d1.getYear()== d2.getYear())
   {
      if(d1.getMonth() == d2.getMonth())
      {
         if(d1.getDay()== d2.getDay())
         {
            return true;
         }
         else
         {
            return false;
         }
      }
      else{
         return false;
      }
   }
   else
   {
      return false;
   }
}

bool operator!=(Date d1, Date d2)
{
   // TODO
   if(d1.getYear()== d2.getYear())
   {
      if(d1.getMonth() == d2.getMonth())
      {
         if(d1.getDay()== d2.getDay())
         {
            return false;
         }
         else
         {
            return true;
         }
      }
      else{
         return true;
      }
   }
   else
   {
      return true;
   }
}

bool operator<(Date d1, Date d2)
{
   // TODO
   int samll_value = d1 - d2;
   Date d3;
   d3 = d1+ samll_value;
   if(d3== d2 )
   {
      return true;
   }
   else
   {
      return false;
   }
}

bool operator<=(Date d1, Date d2)
{
   // TODO
   int value_s = d1 - d2;
   Date d3;
   d3 = d1+ value_s;
   if(d3 ==d2 || d1 == d2 )
   {
      return true;
   }
   else
   {
      return false;
   }
}

bool operator>(Date d1, Date d2)
{
   // TODO
    int big_value = d1 - d2;
    Date d3;
    d3 = d2+big_value;
   if(d3 == d1 )
   {
      return true;
   }
   else
   {
      return false;
   }
}

bool operator>=(Date d1, Date d2)
{
   // TODO
   int big_value = d1 - d2;
   Date d3;
   d3 = d2+big_value;
   if(d3 == d1|| d1 ==d2 )
   {
      return true;
   }
   else
   {
      return false;
   }
}

std::ostream &operator<<(std::ostream &os, Date date){
   // TODO
   os << date.toString();
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
   int num_day=0;
   switch (month)
   {
   case JANUARY:
      num_day =31;
      break;
   case FEBRUARY:
      if(isLeapYear(year))
      {
         num_day = 29;
         break;
      }
      else
      {
         num_day= 28;
         break;
      }
   case MARCH:
      num_day= 31;
      break;
   case APRIL:
      num_day= 30;
      break;
   case MAY:
      num_day= 31;
      break;
   case JUNE:
      num_day= 30;
      break;
   case JULY:
      num_day= 31;
      break;
   case AUGUST:
      num_day= 31;
      break;
   case SEPTEMBER:
      num_day= 30;
      break;
   case OCTOBER:
      num_day= 31;
      break;
   case NOVEMBER:
      num_day= 30;
      break;
   case DECEMBER:
      num_day= 31;
      break;
   }
   return num_day;
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
   if( year%4 == 0 )
   {
      if(year% 100 !=0)
      {
         return true;
      }
      else{
         return false;
      }
   }
   else{
    return false;
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
//运行时间：0.005s,0.006s,0.012s