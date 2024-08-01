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
int daysInMonth(Month month, int year)
{
   // TODO
   switch (month)
   {
   case JANUARY:
      return 31;
      break;
   case FEBRUARY:
        if(isLeapYear(year))
        {
            return 29;
            break;
        }
        else
        {
            return 28;
            break;
        }
   case MARCH:
      return 31;
      break;
   case APRIL:
      return 30;
      break;
   case MAY:
      return 31;
      break;
   case JUNE:
      return 30;
      break;
   case JULY:
      return 31;
      break;
   case AUGUST:
      return 31;
      break;
   case SEPTEMBER:
      return 30;
      break;
   case OCTOBER:
      return 31;
      break;
   case NOVEMBER:
      return 30;
      break;
   case DECEMBER:
      return 31;
      break;
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
   if( year %4 == 0)
   {
    return true;
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
