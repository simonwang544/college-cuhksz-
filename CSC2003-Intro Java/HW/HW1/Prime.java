import java.util.Scanner;

public class Prime {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();

        // Check and print all primes less than or equal to N
        for (int number = 2; number <= N; number++) {
            if (isPrime(number)) {
                System.out.print(number + " ");
            }
        }
        scanner.close();
    }

    // Helper method to check if a number is prime
    public static boolean isPrime(int number) {
        // Only need to check up to the square root of the number
        for (int i = 2; i * i <= number; i++) {
            if (number % i == 0) {
                return false; // Number is divisible by some number other than 1 and itself
            }
        }
        return true; // Number is prime
    }
}
