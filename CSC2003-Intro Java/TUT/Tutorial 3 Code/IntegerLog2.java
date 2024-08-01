import java.util.Scanner;

public class IntegerLog2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();

        int L = 0, R = 30;
        while (L + 1 < R) {
            int MID = (L + R) / 2;
            if (Math.pow(2, MID) > n)
                R = MID;
            else
                L = MID;
        }

        System.out.println(L);
        scanner.close();
    }
}
