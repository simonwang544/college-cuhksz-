import java.util.Scanner;

public class Power {
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int m = scanner.nextInt();//输入m
        int n = scanner.nextInt();//输入n
        System.out.println(isPower(m, n));
        scanner.close();
    }
    //创建判断函数
    public static boolean isPower(int m, int n) {
        if (m == 1) {
            return true;//任何数的零次方等于1，和当递归结束时，m也为1
        }
        if (n == 0 || n == 1) {
            return m == 1;//0和1的任何次方都等于1，返回判断m是否为1
        }
        if (m % n == 0) {
            return isPower(m / n, n);//调用递归，不断的除直到m=1
        }
        
        return false;
    }
}
