import java.util.Scanner;

public class LongestCommonPrefix {
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt(); //获取n
        scanner.nextLine(); // 将被next()去掉的Enter等结束符过滤掉
        
        String[] strings = new String[n];
        for (int i = 0; i < n; i++) {
            strings[i] = scanner.nextLine();
        }
        
        String LCP = longestCommonPrefix(strings); //在一个字符串数组中找到最大前缀
        System.out.println(LCP); // 输出LCP,并自动换行
        
        scanner.close();
    }
    //创建LCP函数
    public static String longestCommonPrefix(String[] strs) {
        if (strs == null || strs.length == 0) return "";//如果没有输入或输入为空，就返回空
        String prefix = strs[0]; //创建prefix字符串，并把字符串数组的第一组赋值给prefix
        
        for (int i = 1; i < strs.length; i++) {
            while (strs[i].indexOf(prefix) != 0) {
                prefix = prefix.substring(0, prefix.length() - 1);//直到找到公共的前缀，不然一直减最后一个字符
                if (prefix.isEmpty()) return "";//如果直到减完还是没有公共前缀，就返回空
            }
        }
        return prefix;
    }
}
