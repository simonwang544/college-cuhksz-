import java.util.Scanner;

public class IntegerLog1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = scanner.nextInt();

        int ans = 0, product = 1;
        while (product <= n) {
            ans++;
            product *= 2;
        }
        ans--;

        System.out.println(ans);

        scanner.close();
    }
}
