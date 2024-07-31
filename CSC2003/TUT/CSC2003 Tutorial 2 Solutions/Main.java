import java.util.Scanner;

public class Main {
    void getMain(int m, int n) {
        // Your code here.
        if (m < n) {
            int mid = n;
            n = m;
            m = mid;
        }
        while (m % n != 0) {
            int mid = n;
            n = m % n;
            m = mid;
        }
        System.out.println(n);
    }

    public static void main(String[] args) {
        Main div = new Main();
        Scanner sc = new Scanner(System.in);
        int m = sc.nextInt();
        int n = sc.nextInt();
        div.getMain(m, n);
        sc.close();
    }
}
