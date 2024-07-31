import java.util.Scanner;
import java.util.Set;
import java.util.HashSet;

public class BanishLetter {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // 读第一行输入，找到要删除的字母，并以空格分开
        String[] charsToDelete = scanner.nextLine().split(" ");//注意：这是字符串数组，每个单位是字符串
        Set<Character> banishChars = new HashSet<>();//创建一个hashSet来存储要删除的字符
        for (String charToDelete : charsToDelete) { //for-each循环遍历charToDelete中的每一个字符
            banishChars.add(charToDelete.charAt(0));//因为每个单位都只有一个字符，但是每个都是字符串，其实就是把每个要删除的元素放到hashset
        }
        //继续读下一行，拿到T的值。并开始处理后面每一行字符串
        int T = Integer.parseInt(scanner.nextLine());
        for (int i = 0; i < T; i++) {//for循环拿取每一行的输入
            String inputString = scanner.nextLine();
            StringBuilder result = new StringBuilder();//创建一个StringBuilder对象，用于构建最终的输出字符串。

            for (char c : inputString.toCharArray()) {//强制将字符串转换为字符数组，并遍历每个字符。
                if (!banishChars.contains(c)) {
                    result.append(c);//如果当前的字符不在要删除列表中，就保留
                }
            }
            //输出想要的结果
            System.out.println(result.toString());
        }
        scanner.close();
    }
}
