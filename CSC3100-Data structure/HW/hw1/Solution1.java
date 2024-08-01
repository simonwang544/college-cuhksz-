import java.util.*;

public class Solution1 {

    /**
     * 判断是否有括号是否整齐
     */
    private static boolean checkParenthesis(String str) {
        if (str == null || str.length() == 0) {
            return false;
        }
        Stack<Character> stack = new Stack<>();
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (c == '(') {
                stack.push(c);
            } else if (c == ')') {
                if (stack.isEmpty()) {
                    return false;
                } else {
                    stack.pop();
                }
            }
        }
        return stack.isEmpty();
    }

    private static boolean checkStringChar(String str) {
        for (int i = 0; i < str.length(); i++) {
            if ("+-*/0123456789sincotaqr. ()".indexOf(str.charAt(i)) < 0) {
                return false;
            }
            if (str.charAt(i) == '.') {
                if (i == 0) {
                    return false;
                }
                if (i == str.length() - 1) {
                    return false;
                }
                if (str.charAt(i - 1) == ' ' || str.charAt(i + 1) == ' ') {
                    return false;
                }
            }
        }
        return true;
    }

    private static boolean checkSpace(String str) {
        //sin tan等符号内部有空格
        for (int i = 0; i < str.length(); i++) {
            if ((str.charAt(i) == 's') && ((!str.substring(i, i + 3).equals("sin")) && (!str.substring(i, i + 4).equals("sqrt"))) && (!str.substring(i+1, i+2).equals("("))) {
                return false;
            }
            if ((str.charAt(i) == 'c') && (!str.substring(i, i + 3).equals("cos"))) {
                return false;
            }
            if ((str.charAt(i) == 't') && (!str.substring(i, i + 3).equals("tan")) && (!str.substring(i+1, i+2).equals("("))) {
                return false;
            }
        }
        return true;
    }


    private static boolean checkStr(String str) {
        //检测括号
        if (!checkParenthesis(str)) {
            return false;
        }

        if (str.length() > 1) {
            //检测字符串
            if (!checkStringChar(str)) {
                return false;
            }

            if (!checkSpace(str)) {
                return false;
            }
        }
        //数字之间没有符号，只有空格
        int cnt_a = 0;
        int cnt_b = 0;
        boolean flag = false;
        //有小数点的时候可以去空格
        /*if (str.contains(".")){*/
        //先去掉头尾空格，如果不符合数字格式就进行下一步
        String new_s_pre = str.trim();
        //System.out.println("qutouwei fuheshuzi" + new_s_pre.matches("-?\\d+(\\.\\d+)?"));
        if (new_s_pre.matches("-?\\d+(\\.\\d+)?")) {
            return true;
        }
        if (!new_s_pre.matches("-?\\d+(\\.\\d+)?")) {
            String new_s = str.replaceAll(" ", "");
            for (int ii = 0; ii < new_s.length(); ii++) {
                if ("+-*/".indexOf(new_s.charAt(ii)) >= 0) {
                    cnt_a += 1;
                }
                if (ii < new_s.length() - 4) {
                    //System.out.println(new_s.substring(ii, ii + 3));
                    if (new_s.substring(ii, ii + 3).equals("sin") || (new_s.substring(ii, ii + 3).equals("cos")) || (new_s.substring(ii, ii + 3).equals("tan")) || (new_s.substring(ii, ii + 4).equals("sqrt"))) {
                        if (ii >= str.length() - 5) {//System.out.println("Invalid 特殊运算靠后");
                            return false;
                        }
                        if (ii == 0) {
                            flag = true;
                        }
                        cnt_b += 1;
                    }
                }
            }
            if (str.contains("sin") && (!str.contains("("))) {
                return false;
            }


            if (str.contains("sqrt") && (!str.contains("("))) {
                return false;
            }
            if ((!flag) && (cnt_a == 0)) {
                return false;
            }
            if (str.contains("tan") && (!str.contains("("))) {
                return false;
            }
            if (str.contains("cos") && (!str.contains("("))) {
                return false;
            }
        }


        str = str.replaceAll(" ", "");
        int i = 0;
        if (str.length() == 1) {
            if ("0123456789".indexOf(str.charAt(0)) == -1) {
                return false;
            }
        }
        if (str.length() > 1) {
            for (i = 0; i < str.length() - 1; i++) {
                if ("-sct(0123456789".indexOf(str.charAt(0)) == -1) {
                    return false;
                }
                if ("+-*/".indexOf(str.charAt(i)) >= 0 && "0123456789sct(".indexOf(str.charAt(i + 1)) == -1) {
                    return false;
                }

                if (str.charAt(i) == '.' && "0123456789".indexOf(str.charAt(i + 1)) == -1) {
                    return false;
                }

                if (str.charAt(0) == '0' && str.charAt(1) == '0') {
                    return false;
                }

                if (i > 0) {
                    if ("+-*/".indexOf(str.charAt(i)) >= 0 && "0123456789snt)(".indexOf(str.charAt(i - 1)) == -1) {
                        return false;
                    }
                }

                if (i >= 1 && str.charAt(i) == '0') {
                    int m = i;
                    int n = i;
                    int k_idx = 0;

                    if (str.charAt(m - 1) == '.' && "0123456789+-*/.)".indexOf(str.charAt(i + 1)) == -1) {
                        return false;
                    }

                    if ("0123456789.".indexOf(str.charAt(m - 1)) == -1 && "+-*/.)".indexOf(str.charAt(i + 1)) == -1) {
                        return false;
                    }

                    n -= 1;
                    while (n > 0) {
                        if ("(+-*/sct".indexOf(str.charAt(n)) >= 0) {
                            break;
                        }
                        if (str.charAt(n) == '.') {
                            k_idx++;
                        }
                        n--;
                    }

                    if (k_idx == 1 && "0123456789+-*/.)".indexOf(str.charAt(i + 1)) == -1) {
                        return false;
                    }
                    if (k_idx > 1) {
                        return false;
                    }

                    if ((k_idx == 0 && str.charAt(n) == '0') || "0123456789+-*/.)".indexOf(str.charAt(i + 1)) == -1) {
                        return false;
                    }
                }

                if (str.charAt(i) == ')' && "+-*/)".indexOf(str.charAt(i + 1)) == -1) {
                    return false;
                }
                if ("0123456789)".indexOf(str.charAt(str.length() - 1)) == -1) {
                    return false;
                }

                if ("123456789".indexOf(str.charAt(i)) >= 0 && "0123456789+-*/.)".indexOf(str.charAt(i + 1)) == -1) {
                    return false;
                }
                if (str.charAt(i) == '(' && "-0123456789cst()".indexOf(str.charAt(i + 1)) == -1) {
                    return false;
                }

                //不能有连续的多个“.”
                if (i > 2 && str.charAt(i) == '.') {
                    int n = i - 1;
                    int k_idx = 0;
                    while (n > 0) {
                        if ("(+-*/gsct".indexOf(str.charAt(n)) >= 0) {
                            break;
                        }
                        if (str.charAt(n) == '.') {
                            k_idx++;
                        }
                        n--;
                    }
                    if (k_idx > 0) {
                        return false;
                    }
                }
            }
        }
        return true;
    }


    private static double handler(String str) {
        str = str.replaceAll(" ", "");
        if (str.matches("-?\\d+\\.\\d+?")) {
            return Double.parseDouble(str);
        }
        int count = 0;
        int start = 0;
        String s1 = "sin";
        String s2 = "cos";
        String s3 = "tan";
        String s4 = "sqrt";
        String s5 = "(";
        while (str.indexOf(s1, start) >= 0 && start < str.length()) {
            count++;
            start = str.indexOf(s1, start) + s1.length();
        }
        while (str.indexOf(s2, start) >= 0 && start < str.length()) {
            count++;
            start = str.indexOf(s2, start) + s2.length();
        }
        while (str.indexOf(s3, start) >= 0 && start < str.length()) {
            count++;
            start = str.indexOf(s3, start) + s3.length();
        }
        while (str.indexOf(s4, start) >= 0 && start < str.length()) {
            count++;
            start = str.indexOf(s4, start) + s4.length();
        }
        while (str.indexOf(s5, start) >= 0 && start < str.length()) {
            count++;
            start = str.indexOf(s5, start) + s5.length();
        }

        if (count == 0) {
            str = str.replaceAll("\\+", "#+#")
                    .replaceAll("-", "#-#")
                    .replaceAll("\\*", "#*#")
                    .replaceAll("\\/", "#/#");
            if (str.startsWith("#")) {
                str = str.substring(1);
            }
            String[] split = str.split("#");
            Double[] nums = new Double[split.length / 2 + 1];
            String[] cals = new String[split.length];
            if (!split[0].equals("-")) {
                for (int i = 0; i < split.length; i++) {
                    if (i % 2 == 0) {
                        nums[i / 2] = Double.parseDouble(split[i]);
                    } else {
                        cals[i / 2] = split[i];
                    }
                }
            } else {
                nums[0] = 0.0;
                for (int i = 0; i < split.length; i++) {
                    if (i % 2 == 0) {
                        cals[i / 2] = split[i];
                    } else {
                        nums[i / 2 + 1] = Double.parseDouble(split[i]);
                    }
                }
            }

            int in = 0;
            while (in < cals.length) {
                if ((cals[in] != null) && (cals[in].equals("/"))) {
                    int in_2 = in;
                    Double pre = nums[in];
                    while ((cals[in] != null) && (cals[in].equals("/"))) {
                        if (nums[in + 1] == 0) {
                            return Integer.MIN_VALUE;
                        }
                        pre /= nums[in + 1];
                        nums[in + 1] = 1.0;
                        cals[in] = "*";
                        in++;
                    }
                    nums[in_2] = pre;
                    //System.out.println(nums[in_2]);
                    in++;
                } else {
                    in++;
                }
            }
            for (int i = cals.length - 1; i > -1; i--) {
                if (cals[i] != null) {
                    if (cals[i].equals("*")) {
                        nums[i] = nums[i] * nums[i + 1];
                        nums[i + 1] = 1.0;
                    }
                }
            }
            Double res = nums[0];
            for (int i = 1; i < nums.length; i++) {
                res = calculation(cals[i - 1], res, nums[i]);
                //System.out.println(res);
            }
            return res;

        } else {
            Stack<Integer> stack = new Stack<>();
            int i = 0;
            String new_str = "0";
            while ((i < str.length()) || (!stack.empty())) {
                //System.out.println(i);
                //System.out.println(str.charAt(i));
                if (str.charAt(i) == '(') {
                    stack.push(i);
                }
                if (str.charAt(i) == ')') {
                    int pos = stack.pop();
                    if (pos == 0) {
                        String sub = str.substring(pos + 1, i);
                        //System.out.println("substring k_idx" + sub);
                        Double pre_res = handler(sub);
                        String pre_str = String.valueOf(pre_res);
                        StringBuilder sb = new StringBuilder(str);
                        sb.replace(pos, i + 1, pre_str);
                        new_str = sb.toString();
                        //System.out.println("new for before ope" + new_str);
                        new_str = oper(new_str);
                        //System.out.println("new for after ope" + new_str);

                    }
                    else if ((pos > 0) && ("+-*/".indexOf(str.charAt(pos - 1)) >= 0)) {
                        String sub = str.substring(pos + 1, i);
                        //System.out.println("substring k_idx" + sub);
                        Double pre_res = handler(sub);
                        String pre_str = String.valueOf(pre_res);
                        StringBuilder sb = new StringBuilder(str);
                        sb.replace(pos, i + 1, pre_str);
                        new_str = sb.toString();
                        //System.out.println("new for before ope" + new_str);
                        new_str = oper(new_str);
                        //System.out.println("new for after ope" + new_str);

                    } else if ((pos >= 4) && (str.substring(pos - 4, pos).equals("sqrt"))) {
                        String sub = str.substring(pos + 1, i);
                        //System.out.println("substring k_idx" + sub);
                        //Double pre_res = 0.0;
                        if (handler(sub) < 0) {
                            return Integer.MIN_VALUE;
                        } else {
                            Double pre_res = Math.sqrt(handler(sub));
                            String pre_str = String.valueOf(pre_res);
                            StringBuilder sb = new StringBuilder(str);
                            sb.replace(pos - 4, i + 1, pre_str);
                            new_str = sb.toString();
                            //System.out.println("new for before ope" + new_str);
                            new_str = oper(new_str);
                            //System.out.println("new for after ope" + new_str);
                        }
                    } else if ((pos >= 3) && (str.substring(pos - 3, pos).equals("sin"))) {
                        String sub = str.substring(pos + 1, i);
                        //System.out.println("substring k_idx" + sub);
                        Double pre_res = Math.sin(handler(sub));
                        String pre_str = String.valueOf(pre_res);
                        StringBuilder sb = new StringBuilder(str);
                        sb.replace(pos - 3, i + 1, pre_str);
                        new_str = sb.toString();
                        //System.out.println("new for before ope" + new_str);
                        new_str = oper(new_str);
                        //System.out.println("new for after ope" + new_str);

                    } else if ((pos >= 3) && (str.substring(pos - 3, pos).equals("cos"))) {
                        String sub = str.substring(pos + 1, i);
                        //System.out.println("substring k_idx" + sub);
                        Double pre_res = Math.cos(handler(sub));
                        String pre_str = String.valueOf(pre_res);
                        StringBuilder sb = new StringBuilder(str);
                        sb.replace(pos - 3, i + 1, pre_str);
                        new_str = sb.toString();
                        //System.out.println("new for before ope" + new_str);
                        new_str = oper(new_str);
                        //System.out.println("new for after ope" + new_str);

                    } else if ((pos >= 3) && (str.substring(pos - 3, pos).equals("tan"))) {
                        String sub = str.substring(pos + 1, i);
                        //System.out.println("substring k_idx" + sub);
                        Double pre_res = Math.tan(handler(sub));
                        String pre_str = String.valueOf(pre_res);
                        StringBuilder sb = new StringBuilder(str);
                        sb.replace(pos - 3, i + 1, pre_str);
                        new_str = sb.toString();
                        //System.out.println("new for before ope" + new_str);
                        new_str = oper(new_str);
                        //System.out.println("new for after ope" + new_str);
                    }
                    //catch (Exception e){System.out.println("Invalid");}
                }
                i++;
            }
            if (new_str != "0") {
                //System.out.println("new formula k_idx" + new_str);
                return handler(new_str);
            }
            return Integer.MIN_VALUE;
        }/*}*/
    }

    private static Double calculation(String index, Double pre, Double curr) {
        switch (index) {
            case "+":
                return pre + curr;
            case "-":
                return pre - curr;
            case "*":
                return pre * curr;
            case "/":
                return pre / curr;
        }
        return pre + curr;
    }

    private static Integer fin(String str, int idx) {
        for (int i = idx; i >= 0; i--) {
            if ("+-".indexOf(str.charAt(i)) >= 0) {
                return i;
            }
        }
        return 0;
    }

    private static String oper(String str) {
        if (str.contains("*-")) {
            int idx = str.indexOf("*-");
            int b = fin(str, idx);
            if (b == 0) {
                str = "-" + str.substring(0, idx) + "*" + str.substring(idx + 2);
            } else {
                if (str.charAt(b) == '+') {
                    str = str.substring(0, b) + "-" + str.substring(b + 1, idx) + "*" + str.substring(idx + 2);
                } else {
                    str = str.substring(0, b) + "+" + str.substring(b + 1, idx) + "*" + str.substring(idx + 2);
                }
            }
        }
        if (str.contains("/-")) {
            int idx = str.indexOf("/-");
            int b = fin(str, idx);
            if (b == 0) {
                str = "-" + str.substring(0, idx) + "/" + str.substring(idx + 2);
            } else {
                if (str.charAt(b) == '+') {
                    str = str.substring(0, b) + "-" + str.substring(b + 1, idx) + "/" + str.substring(idx + 2);
                } else {
                    str = str.substring(0, b) + "+" + str.substring(b + 1, idx) + "/" + str.substring(idx + 2);
                }
            }
        }
        if (str.contains("+-")) {
            int idx = str.indexOf("+-");
            str = str.substring(0, idx) + "-" + str.substring(idx + 2);
        }
        if (str.contains("--")) {
            int idx = str.indexOf("--");
            if (idx == 0) {
                str = str.substring(idx + 2);
            } else {
                str = str.substring(0, idx) + "+" + str.substring(idx + 2);
            }
        }
        return str;
    }


    private static void error() {
        System.out.println("invalid");
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        while (input.hasNextLine()) {
            String text = input.nextLine();
            if (checkStr(text)) {
                System.out.println(Math.round(handler(text)));
            } else {
                error();
            }
        }
    }


}