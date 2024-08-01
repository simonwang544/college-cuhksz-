import java.util.Scanner;

public class Matrix {

        //乘法函数
        private static int[][] multiplyMatrices(int[][] A, int[][] B) {
            int A_Rows = A.length;//A的行数
            int A_Columns = A[0].length;//A的列数
            int B_Rows = B.length;//B的行数
            int B_Columns = B[0].length;//B的列数
            //创建result矩阵
            int[][] result = new int[A_Rows][B_Columns];
            //开始计算并填充
            for (int i = 0; i < A_Rows; i++) {
                for (int j = 0; j < B_Columns; j++) {
                    for (int k = 0; k < A_Columns; k++) {
                        result[i][j] += A[i][k] * B[k][j];//乘法，A的行*B的列
                    }
                }
            }
            
            return result;
        }
        //加法函数
        private static int[][] addMatrices(int[][] A, int[][] B) {
            int rows = A.length;
            int columns = A[0].length;
            //创建result矩阵
            int[][] result = new int[rows][columns];
            //开始计算并填充
            for (int i = 0; i < rows; i++) {
                for (int j = 0; j < columns; j++) {
                    result[i][j] = A[i][j] + B[i][j];//对应位置相加即可
                }
            }
            
            return result;
        }
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int T = scanner.nextInt();//获取T nextInt只读取下一个整数无视包括其他的任何符号，不是整数会报错
        
        while (T-- > 0) { //这个 while 循环迭代 T 次，每次迭代都会递减 T 直到达到 0。
            int m = scanner.nextInt(); //获取m
            int n = scanner.nextInt(); //获取n
            int p = scanner.nextInt(); //获取p
            int q = scanner.nextInt(); //获取q
            int r = scanner.nextInt(); //获取r
            //创建A数组m*n
            int[][] A = new int[m][n]; 
            for (int i = 0; i < m; i++) {
                for (int j = 0; j < n; j++) {
                    A[i][j] = scanner.nextInt(); //两个for循环，填充数组A
                }
            }
            //创建B数组p*q
            int[][] B = new int[p][q]; 
            for (int i = 0; i < p; i++) {
                for (int j = 0; j < q; j++) {
                    B[i][j] = scanner.nextInt(); //两个for循环，填充数组B
                }
            }
            //创建结果数组
            int[][] result; 
            if (r == 0) { //判断是执行哪个操作
                result = multiplyMatrices(A, B);  // 调用乘法函数
            } else {
                result = addMatrices(A, B);  // 调用加法函数
            }
            //开始输出结果
            for (int i = 0; i < result.length; i++) {
                for (int j = 0; j < result[i].length; j++) {
                    System.out.print(result[i][j]);
                    if (j < result[i].length - 1) {
                        System.out.print(" ");
                    }
                }
                System.out.println();//用于将文本打印到控制台，然后将光标移动到新行。
            }
        }
        scanner.close();//释放相关资源
    }

}