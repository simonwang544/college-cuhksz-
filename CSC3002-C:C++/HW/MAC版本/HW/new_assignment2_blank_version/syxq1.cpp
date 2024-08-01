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
   if (s == "JANUARY")
   {
      return JANUARY;
   }
   if (s == "FEBRUARY")
   {
      return FEBRUARY;
   }
   if (s == "MARCH")
   {
      return MARCH;
   }
   if (s == "APRIL")
   {
      return APRIL;
   }
   if (s == "MAY")
   {
      return MAY;
   }
   if (s == "JUNE")
   {
      return JUNE;
   }
   if (s == "JULY")
   {
      return JULY;
   }
   if (s == "AUGUST")
   {
      return AUGUST;
   }
   if (s == "SEPTEMBER")
   {
      return SEPTEMBER;
   }
   if (s == "OCTOBER")
   {
      return OCTOBER;
   }
   if (s == "NOVEMBER")
   {
      return NOVEMBER;
   }
   if (s == "DECEMBER")
   {
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
   case 1:
      return "JANUARY";
   case 2:
      return "FEBRUARY";
   case 3:
      return "MARCH";
   case 4:
      return "APRIL";
   case 5:
      return "MAY";
   case 6:
      return "JUNE";
   case 7:
      return "JULY";
   case 8:
      return "AUGUST";
   case 9:
      return "SEPTEMBER";
   case 10:
      return "OCTOBER";
   case 11:
      return "NOVEMBER";
   case 12:
      return "DECEMBER";

   default:
      return "???";
   }
}

Month operator++(Month &month, int)
{
   // TODO
   switch (month)
   {
   case 1:
      return FEBRUARY;
   case 2:
      return MARCH;
   case 3:
      return APRIL;
   case 4:
      return MAY;
   case 5:
      return JUNE;
   case 6:
      return JULY;
   case 7:
      return AUGUST;
   case 8:
      return SEPTEMBER;
   case 9:
      return OCTOBER;
   case 10:
      return NOVEMBER;
   case 11:
      return DECEMBER;
   case 12:
      return JANUARY;
   }
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
   int month_arr[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
   int count = 0, count1 = 0;
   if (isLeapYear(year))
   {
      //表明是闰年

      month_arr[1] = 29;
   }
   for (int i = 0; i < 12; i++)
   {
      count1 = count;
      count += month_arr[i];
      if (dayInYear >= count1 && dayInYear <= count)
      {
         return dayInYear - count1;
      }
   }
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
   Month m;
   int month_arr[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
   int count = 0, count1 = 0;
   if (isLeapYear(year))
   {
      //表明是闰年

      month_arr[1] = 29;
      for (int i = 0; i < 12; i++)
      {
         count1 = count;
         count += month_arr[i];
         if (dayInYear > count1 && dayInYear <= count)
         {
            switch (i)
            {
            case 0:
               return JANUARY;
            case 1:
               return FEBRUARY;
            case 2:
               return MARCH;
            case 3:
               return APRIL;
            case 4:
               return MAY;
            case 5:
               return JUNE;
            case 6:
               return JULY;
            case 7:
               return AUGUST;
            case 8:
               return SEPTEMBER;
            case 9:
               return OCTOBER;
            case 10:
               return NOVEMBER;
            case 11:
               return DECEMBER;
            }
         }
      }
   }
   else
   {
      //表明是平年

      for (int i = 0; i < 12; i++)
      {
         count1 = count;
         count += month_arr[i];
         if (dayInYear >= count1 && dayInYear <= count)
         {
            switch (i)
            {
            case 0:
               return JANUARY;
            case 1:
               return FEBRUARY;
            case 2:
               return MARCH;
            case 3:
               return APRIL;
            case 4:
               return MAY;
            case 5:
               return JUNE;
            case 6:
               return JULY;
            case 7:
               return AUGUST;
            case 8:
               return SEPTEMBER;
            case 9:
               return OCTOBER;
            case 10:
               return NOVEMBER;
            case 11:
               return DECEMBER;
            }
         }
      }
   }
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
 * day/month/year values.
 */

string Date::toString()
{
   // TODO
   string mth;
   string day;
   string year;
   switch (month)
   {
   case 1:
      mth = "Jan";
      break;
   case 2:
      mth = "Feb";
      break;
   case 3:
      mth = "Mar";
      break;
   case 4:
      mth = "Apr";
      break;
   case 5:
      mth = "May";
      break;
   case 6:
      mth = "Jun";
      break;
   case 7:
      mth = "Jul";
      break;
   case 8:
      mth = "Aug";
      break;
   case 9:
      mth = "Sep";
      break;
   case 10:
      mth = "Oct";
      break;
   case 11:
      mth = "Nov";
      break;
   case 12:
      mth = "Dec";
      break;

      // default:
      //    return "???";
   }
   string date_string; //以下为 按规范格式输出dd/mmm/yyyy
   int a = getDay();
   day = integerToString(a);
   int b = getYear();
   year = integerToString(b);
   date_string.append(day);
   // cout<<date_string<<day<<month<<year;
   date_string.push_back('-');
   date_string.append(mth);
   date_string.push_back('-');
   date_string.append(year);
   // cout<<date_string;
   return date_string;
}

string Date::capitalize(string str)
{
   // TODO
   str = toUpperCase(str);
}

void Date::initDate(int day, Month month, int yyyy)
{
   // TODO
   this->day = day;
   this->month = month;
   this->year = yyyy;
   // this->dayInYear = 0;
   switch (month)
   {
   case 1:
      dayInYear = day;
      break;
   case 2:
      dayInYear = day + 31;
      break;
   case 3:
      if (isLeapYear(year))
      {
         dayInYear = day + 29 + 31;
         break;
      }
      else
      {
         dayInYear = day + 28 + 31;
         break;
      }
   case 4:
      if (isLeapYear(year))
      {
         dayInYear = day + 29 + 31 + 31;
         break;
      }
      else
      {
         dayInYear = day + 28 + 31 + 31;
         break;
      }
   case 5:
      if (isLeapYear(year))
      {
         dayInYear = day + 29 + 31 + 31 + 30;
         break;
      }
      else
      {
         dayInYear = day + 28 + 31 + 31 + 30;
         break;
      }
   case 6:
      if (isLeapYear(year))
      {
         dayInYear = day + 29 + 31 + 31 + 30 + 31;
         break;
      }
      else
      {
         dayInYear = day + 28 + 31 + 31 + 30 + 31;
         break;
      }
   case 7:
      if (isLeapYear(year))
      {
         dayInYear = day + 29 + 31 + 31 + 30 + 31 + 30;
         break;
      }
      else
      {
         dayInYear = day + 28 + 31 + 31 + 30 + 31 + 30;
         break;
      }
   case 8:
      if (isLeapYear(year))
      {
         dayInYear = day + 29 + 31 + 31 + 30 + 31 + 30 + 31;
         break;
      }
      else
      {
         dayInYear = day + 28 + 31 + 31 + 30 + 31 + 30 + 31;
         break;
      }
   case 9:
      if (isLeapYear(year))
      {
         dayInYear = day + 29 + 31 + 31 + 30 + 31 + 30 + 31 + 31;
         break;
      }
      else
      {
         dayInYear = day + 28 + 31 + 31 + 30 + 31 + 30 + 31 + 31;
         break;
      }
   case 10:
      if (isLeapYear(year))
      {
         dayInYear = day + 29 + 31 + 31 + 30 + 31 + 30 + 31 + 31 + 30;
         break;
      }
      else
      {
         dayInYear = day + 28 + 31 + 31 + 30 + 31 + 30 + 31 + 31 + 30;
         break;
      }
   case 11:
      if (isLeapYear(year))
      {
         dayInYear = day + 29 + 31 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31;
         break;
      }
      else
      {
         dayInYear = day + 28 + 31 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31;
         break;
      }
   case 12:
      if (isLeapYear(year))
      {
         dayInYear = day + 29 + 31 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30;
         break;
      }
      else
      {
         dayInYear = day + 28 + 31 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30;
         break;
      }
   }
}

Date operator+(Date date, int delta)
{
   // TODO
   date.dayInYear += delta;
   return date;
}

Date operator-(Date date, int delta)
{
   // TODO
}

int operator-(Date d1, Date d2)
{
   // TODO
}

Date &operator+=(Date &date, int delta)
{
   // TODO
}

Date &operator-=(Date &date, int delta)
{
   // TODO
}

Date operator++(Date &date)
{
   // TODO
}

Date operator++(Date &date, int)
{
   // TODO
}

Date operator--(Date &date)
{
   // TODO
}

Date operator--(Date &date, int)
{
   // TODO
}

bool operator==(Date d1, Date d2)
{
   // TODO
}

bool operator!=(Date d1, Date d2)
{
   // TODO
}

bool operator<(Date d1, Date d2)
{
   // TODO
}

bool operator<=(Date d1, Date d2)
{
   // TODO
}

bool operator>(Date d1, Date d2)
{
   // TODO
}

bool operator>=(Date d1, Date d2)
{
   // TODO
}

std::ostream &operator<<(std::ostream &os, Date date)
{
   // TODO
   return cout<<date.toString();
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
   switch (month)
   {
   case 1:
      return 31;
   case 2:
      if (isLeapYear(year))
      {
         return 29;
      }
      else
      {
         return 28;
      }
   case 3:
      return 31;
   case 4:
      return 30;
   case 5:
      return 31;
   case 6:
      return 30;
   case 7:
      return 31;
   case 8:
      return 31;
   case 9:
      return 30;
   case 10:
      return 31;
   case 11:
      return 30;
   case 12:
      return 31;
   }
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
   if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
   {
      return true;
   }
   else
   {
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
      cout<< moonLanding +5;
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
