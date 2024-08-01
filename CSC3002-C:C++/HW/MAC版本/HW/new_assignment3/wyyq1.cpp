/* Q1:
 * File: GymJudge.cpp
 * ------------------
 * This program averages a set of gymnastic scores after eliminating
 * the lowest and highest scores.
 */
#include "csc300222fall/assignment3/GymnasticsJudge.h"
using namespace std;

/* Function prototypes */

double sumArray(double array[], int n);
double findLargest(double scores[], int n);
double findSmallest(double scores[], int n);
int readScores(double scores[], int max);

/*
 * Function: sumArray
 * Usage: double sum = sumArray(array, n);
 * ---------------------------------------
 * This function returns the sum of the first n elements in array.
 */

double sumArray(double array[], int n) {
   // TODO
   double sum;
   for (int i = 0; i < n; i++){
      sum += array[i];
   }
   return sum;
}

/*
 * Function: findLargest
 * Usage: double largest = findLargest(array, n);
 * ----------------------------------------------
 * This function returns the largest value in the first n elements in array.
 */

double findLargest(double array[], int n) {
   // TODO
   double Largest = 0;
   for (int i = 0; i < n; i++){
      if (Largest < array[i]){
         Largest = array[i];
      }
   }
   return Largest;
}

/*
 * Function: findSmallest
 * Usage: double smallest = findSmallest(array, n);
 * ------------------------------------------------
 * This function returns the smallest value in the first n elements in array.
 */

double findSmallest(double array[], int n) {
   // TODO
   double Smallest;
   for (int i = 0; i < n; i++){
      if (Smallest > array[i]){
         Smallest = array[i];
      }
   }
   return Smallest;
}

/* DO NOT modify this part*/
/*
 * Function: readScores
 * Usage: int nJudges = readScores(scores, max);
 * ---------------------------------------------
 * This function reads in scores for each of the judges.  The array这个函数读取每个裁判的分数。数组分数必须由调用者声明，并且必须有一个max的分配大小。返回值是分数的数量。从用户的角度来看，裁判的编号以1开头，因为这种编号风格更常见;在内部，数组索引值以0开头。
 * scores must be declared by the caller and must have an allocated
 * size of max.  The return value is the number of scores.  From the
 * user's perspective, the numbering of the judges begins with 1
 * because that style of numbering is more familiar; internally,
 * the array index values begin with 0.
 */

int readScores(double scores[], int max) {
   cerr << "Enter a score for each judge in the range " << MIN_SCORE;
   cerr << " to " << MAX_SCORE << "." << endl;
   cerr << "Enter a blank line to signal the end of the list." << endl;
   int n = 0;
   string line;
   while (n < max) {
      cerr<<"Judge #" + integerToString(n + 1) + ": " ;
      getline(cin,line);
      if (line == "") return n;
      double score = stringToReal(line);
      if (MIN_SCORE <= score && score <= MAX_SCORE) {
         scores[n++] = score;
      } else {
         cout << "That score is out of range." << endl;
      }
   }
   return max;
}


/* DO NOT modify the main() part*/

int main() {
   double scores[MAX_JUDGES];
   int nJudges = readScores(scores, MAX_JUDGES);
   if (nJudges < 3) {
      cout << "You must enter scores for at least three judges." << endl;
   } else {
      double total = sumArray(scores, nJudges);
      double smallest = findSmallest(scores, nJudges);
      double largest = findLargest(scores, nJudges);
      double average = (total - smallest - largest) / (nJudges - 2);
      cout << "The average after eliminating "
           << fixed << setprecision(2) << smallest << " and "
           << setprecision(2) << largest << " is "
           << setprecision(2) << average << "." << endl;
   }
   return 0;
}