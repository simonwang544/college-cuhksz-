// This is the template for the TestFibonacci problem.

import java.util.Scanner;

public class TestFibonacciTemp {
    void fibo(int n, int d){
        // Your code here.
        int[] arr = new int [1000];
        arr[0]=1;
        arr[1]=1;
        for(int i= 2; i <1000; i++){
            arr[i] = arr[i-1]+arr[i-2];
        }
        for(int i = n-1; i >= n-d; i--){
            System.out.print(arr[i]);
            if(i != n - d){
                System.out.print(", ");
            }
        }
        System.out.println();

    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        TestFibonacci tf = new TestFibonacci();
        int m = sc.nextInt();
        sc.nextLine();
        for(int i = 0; i < m; i++){
            String[] arr = sc.nextLine().split(", ");
            int n = Integer.parseInt(arr[0]);
            int d = Integer.parseInt(arr[1]);
            tf.fibo(n, d);
        }
        sc.close();
    }
    
}
