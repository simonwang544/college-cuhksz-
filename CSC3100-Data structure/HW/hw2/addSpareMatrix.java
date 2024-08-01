import java.util.Scanner;
import static java.lang.Integer.parseInt;

public class addSpareMatrix{
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String[] row1 = input.nextLine().split(" ");
        int row = parseInt(row1[0].substring(0,row1[0].length()-1))+1; //行
        int col = parseInt(row1[1])+1; //列
        
        int[][] matrix = new int[row][col]; //声明二位数组
        for (int i = 1; i < row; i++) { //赋值
            for (int j = 1; j < col; j++) {
                matrix[i][j] = 0;
            }
        }
        //input.nextLine();//nextInt不能读入换行符，需要把第一行后的换行符读掉

        for (int i = 1; i < row; i++) {
            String[] ope = input.nextLine().split(" ");  //ope[0]是行
/*            for (int k = 0; k <ope.length; k++)
                System.out.println(ope[k]);*/
            if (!ope[1].equals(":")){       //这一行有值输入，不全为0；
                for (int j = 1;j < ope.length; j++){
                    String[] num = ope[j].split(":");   //:前面是第几列 冒号后边是值
                    matrix[i][parseInt(num[0])] = parseInt(num[1]);
//                    System.out.println("yes");
                }
            }
        }
         //再读掉；行和列
        String[] row2 = input.nextLine().split(" ");
        row = parseInt(row2[0].substring(0,row2[0].length()-1))+1; //行
        col = parseInt(row2[1])+1; //列
        //input.nextLine();//nextInt不能读入换行符，需要把第一行后的换行符读掉
        for (int i = 1; i < row; i++) {
            String[] ope = input.nextLine().split(" ");  //ope[0]是行
            if (!ope[1].equals(":")){       //这一行有值输入，不全为0；
                for (int j = 1;j < ope.length; j++){
                    String[] num = ope[j].split(":");   //:前面是第几行 冒号后边是值
                    matrix[i][parseInt(num[0])] += parseInt(num[1]); //直接相加
//                    System.out.println(matrix[i][parseInt(num[0])]);
//                    System.out.println("no");
                }
            }
        }
        //输出结果行列值
        System.out.println((row-1)+", "+(col-1));

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
        for (int i = 1; i < row; i++){
            s += String.valueOf(i);
            for (int j = 1; j < col; j++){
                if (matrix[i][j] != 0){
                    flag = false; //不全为0
                    s += " " + j + ":" + matrix[i][j];   //最后不能有空格，把空格加在元素前面就好
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
