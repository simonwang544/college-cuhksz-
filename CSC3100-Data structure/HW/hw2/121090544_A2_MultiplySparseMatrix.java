import java.util.Scanner;

import static java.lang.Integer.parseInt;
public class MultiplySparseMatrix {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        //读入行列值
        String[] matrix1 = input.nextLine().split(" ");
        int row1 = parseInt(matrix1[0].substring(0,matrix1[0].length()-1))+1; //行
        int col1 = parseInt(matrix1[1])+1; //列

        int[][] matrix_1 = new int[row1][col1]; //声明二位数组
        for (int i = 1; i < row1; i++) { //赋值
            for (int j = 1; j < col1; j++) {
                matrix_1[i][j] = 0;
            }
        }
        //填充数组
        for (int i = 1; i < row1; i++) {
            String[] ope1 = input.nextLine().split(" ");  //ope[0]是行
/*            for (int k = 0; k <ope.length; k++)
                System.out.println(ope[k]);*/
            if (!ope1[1].equals(":")){       //这一行有值输入，不全为0；
                for (int j = 1;j < ope1.length; j++){
                    String[] num1 = ope1[j].split(":");   //:前面是第几列 冒号后边是值
                    matrix_1[i][parseInt(num1[0])] = parseInt(num1[1]);
//                    System.out.println(matrix_1[i][parseInt(num1[0])]);
//                   System.out.println("yes");
                }
            }
        }
        //再读第二个数组；行和列值
        String[] matrix2 = input.nextLine().split(" ");
        int row2 = parseInt(matrix2[0].substring(0,matrix2[0].length()-1))+1; //行
        int col2 = parseInt(matrix2[1])+1; //列
        int[][] matrix_2 = new int[row2][col2]; //声明第二个二维数组
        for (int i = 1; i < row2; i++) { //赋值
            for (int j = 1; j < col2; j++) {
                matrix_2[i][j] = 0;
            }
        }
        //填充数组
        for (int i = 1; i < row2; i++) {
            String[] ope2 = input.nextLine().split(" ");  //ope[0]是行
            if (!ope2[1].equals(":")){       //这一行有值输入，不全为0；
                for (int j = 1;j < ope2.length; j++){
                    String[] num2 = ope2[j].split(":");   //:前面是第几行 冒号后边是值
                    matrix_2[i][parseInt(num2[0])] = parseInt(num2[1]);
//                    System.out.println(matrix_2[i][parseInt(num2[0])]);
//                    System.out.println("no");
                }
            }
        }
        //构建第三个数组，并填充
        int[][] result = new int[row1][col2];
        for (int i = 1; i < row1; i++){
            for (int j = 1; j < col2; j++){
                int m_result = 0;
                for (int k = 1; k < col1; k++) {
                    m_result += matrix_1[i][k] * matrix_2[k][j];
                }
                result[i][j] = m_result;
            }
        }
        System.out.println((row1-1)+", "+(col2-1));
        String s = "";
/*        for (int i = 1; i < row ; i++){
            for (int j = 1; j < col; j++){
                s += " " + matrix[i][j];
               System.out.println("a");
            }
            System.out.println(s);
            s = "";
        }*/
        boolean flag = true; //这一行全为0
        for (int i = 1; i < row1; i++){
            s += String.valueOf(i);
            for (int j = 1; j < col2; j++){
                if (result[i][j] != 0){
                    flag = false; //不全为0
                    s += " " + j + ":" + result[i][j];   //最后不能有空格，把空格加在元素前面就好
                }
            }
            if (flag)
                s += " :";
            System.out.println(s);
            flag = true; //继续进行下一行
            s = "";
        }

    }
}
