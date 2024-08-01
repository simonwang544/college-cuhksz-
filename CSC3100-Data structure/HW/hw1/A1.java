import java.util.*;

public class A1 {
    private static String[] arrayStr(String str) {

        int strLen = str.length();
        String[] Array = new String[strLen];
        char[] buffer = new char[strLen];
        int index = 0;
        int count = 0;

        for (int i = 0; i < strLen; i++) {

            char ch = str.charAt(i);

            if (ch == '-' && i == 0) {
                Array[0] = "-1";
                Array[1] = "*";
                index += 2;
            } else if (isNumber(ch) || ch == '.') {
                if (i == 0 && ch == '.') {
                    Array[0] = null;
                    return Array;
                }
                buffer[count] = ch;
                count++;
            } else if (ch == ' ') {
                if (i != 0 && (str.charAt(i - 1) == '.' || str.charAt(i + 1) == '.')) {
                    Array[0] = null;
                    return Array;
                }
                if (count != 0) {
                    StringBuilder number = new StringBuilder();
                    for (int j = 0; j < count; j++) {
                        number.append(buffer[j]);
                    }
                    Array[index] = number.toString();
                    index++;
                    count = 0;
                }

            } else {
                boolean Check_operator = ((str.charAt(i) == '(')
                        || (str.charAt(i) == ')')
                        || (str.charAt(i) == '+')
                        || (str.charAt(i) == '-')
                        || (str.charAt(i) == '*')
                        || (str.charAt(i) == '/')
                        || ((i + 3 < strLen) && str.substring(i, i + 3).equals("sin"))
                        || ((i + 3 < strLen) && str.substring(i, i + 3).equals("cos"))
                        || ((i + 3 < strLen) && str.substring(i, i + 3).equals("tan"))
                        || ((i + 4 < strLen) && str.substring(i, i + 4).equals("sqrt")));

                if (Check_operator) {

                    if (count != 0) {
                        String number = "";
                        for (int j = 0; j < count; j++) {
                            number += buffer[j];
                        }
                        Array[index] = number;
                        index++;
                        count = 0;
                    }

                    if (i + 3 < strLen) {
                        if (str.substring(i, i + 3).equals("sin") || str.substring(i, i + 3).equals("cos") || str.substring(i, i + 3).equals("tan")) {
                            Array[index] = str.substring(i, i + 3);
                            index++;
                            i += 2;
                        }
                    }

                    if (i + 4 < strLen) {
                        if (str.substring(i, i + 4).equals("sqrt")) {
                            Array[index] = str.substring(i, i + 4);
                            index++;
                            i += 3;
                        }
                    }

                    if (ch == '(' || ch == ')' || ch == '+' || ch == '-' || ch == '*' || ch == '/') {
                        if (ch == '-' && str.charAt(i - 1) == '(') {
                            buffer[count] = ch;
                            count++;
                        } else {
                            String op = String.valueOf(str.charAt(i));
                            Array[index] = op;
                            index++;
                        }
                    }
                } else {
                    Array[0] = null;
                    return Array;
                }
            }
        }

        if (count != 0) {
            StringBuilder number = new StringBuilder();
            for (int j = 0; j < count; j++) {
                number.append(buffer[j]);
            }
            Array[index] = number.toString();
            index++;
            count = 0;
        }

        return Array;
    }


    private static String[] arraySuffix(String[] arr) {

        try {

            Stack<String> operstack = new Stack<String>();
            int arrlen = arr.length;

            for (int i = 0; i < arr.length; i++) {
                if (arr[i] == null) arrlen--;
            }

            String[] Array = new String[arrlen];

            int index = 0;

            for (int i = 0; i < arrlen; i++) {
                assert arr[i] != null;
                if (isOper(arr[i])) {
                    if (operstack.isEmpty()) {
                        operstack.push(arr[i]);
                    } else {
                        if (arr[i].equals("(")) {
                            operstack.push(arr[i]);
                        } else if (arr[i].equals(")")) {
                            while (!operstack.peek().equals("(")) {
                                Array[index] = operstack.pop();
                                index++;
                            }
                            operstack.pop();
                        } else {
                            if (operstack.peek().equals("(")) {
                                operstack.push(arr[i]);
                            } else {
                                if (!operstack.isEmpty() && (getPriority(arr[i]) > getPriority(operstack.peek()))) {
                                    operstack.push(arr[i]);
                                } else {
                                    while (!operstack.isEmpty() && (getPriority(arr[i]) <= getPriority(operstack.peek()))) {
                                        Array[index] = operstack.pop();
                                        index++;
                                        if (operstack.isEmpty() || operstack.peek().equals("(")) {
                                            operstack.push(arr[i]);
                                            break;
                                        }
                                    }
                                    if (getPriority(arr[i]) > getPriority(operstack.peek())) {
                                        operstack.push(arr[i]);
                                    }
                                }
                            }
                        }
                    }
                } else if (!isOper(arr[i])) {
                    Array[index] = arr[i];
                    index++;
                }  // do nothing

            }

            while (!operstack.isEmpty()) {
                Array[index] = operstack.pop();
                index++;
            }
            String[] result = new String[index];
            System.arraycopy(Array, 0, result, 0, index);
            return result;
        } catch (Exception e) {
            String[] error = new String[1];
            error[0] = "error";
            return error;
        }


    }


    public static double parse(String str) {
        double invalid = Double.NaN;
        String[] arr = arrayStr(str);
        if (arr[0] == null) {
            return invalid;
        }

        String[] postarr = arraySuffix(arr);
        if (postarr[0].equals("error")) {
            return invalid;
        }
        int[] result = call(postarr);
        if (result[0] == 0) {
            return invalid;
        }
        return result[1];
    }

    private static boolean isOper(String str) {
        return str.equals("(")
                || str.equals(")")
                || str.equals("*")
                || str.equals("/")
                || str.equals("+")
                || str.equals("-")
                || str.equals("sin")
                || str.equals("cos")
                || str.equals("tan")
                || str.equals("sqrt");
    }

    private static int[] call(String[] arr) {
        try {
            int[] result = new int[2];

            result[0] = 1;

            Stack<String> numstack = new Stack<String>();
            int arrlen = arr.length;

            for (String s : arr) {
                if (!isOper(s)) {
                    numstack.push(s);
                } else {
                    switch (s) {
                        case "+": {
                            Double num1 = Double.parseDouble(numstack.pop());
                            Double num2 = Double.parseDouble(numstack.pop());
                            Double tmp = (double) num1 + num2;
                            numstack.push(tmp.toString());
                            break;
                        }
                        case "-": {
                            Double num1 = Double.parseDouble(numstack.pop());
                            Double num2 = Double.parseDouble(numstack.pop());
                            Double tmp = (double) num2 - num1;
                            numstack.push(tmp.toString());
                            break;
                        }
                        case "*": {
                            Double num1 = Double.parseDouble(numstack.pop());
                            Double num2 = Double.parseDouble(numstack.pop());
                            Double tmp = (double) num1 * num2;
                            numstack.push(tmp.toString());
                            break;
                        }
                        case "/": {
                            Double num1 = Double.parseDouble(numstack.pop());
                            Double num2 = Double.parseDouble(numstack.pop());
                            Double tmp = (double) num2 / num1;
                            if (Double.isNaN(tmp)) {
                                result[0] = 0;
                            }
                            numstack.push(tmp.toString());
                            break;
                        }
                        case "sin": {
                            Double num1 = Double.parseDouble(numstack.pop());
                            Double tmp = (double) Math.sin(num1);
                            numstack.push(tmp.toString());
                            break;
                        }
                        case "cos": {
                            Double num1 = Double.parseDouble(numstack.pop());
                            Double tmp = (double) Math.cos(num1);
                            numstack.push(tmp.toString());
                            break;
                        }
                        case "tan": {
                            Double num1 = Double.parseDouble(numstack.pop());
                            Double tmp = (double) Math.tan(num1);
                            numstack.push(tmp.toString());
                            break;
                        }
                        case "sqrt": {
                            Double num1 = Double.parseDouble(numstack.pop());
                            Double tmp = (double) Math.sqrt(num1);
                            if (Double.isNaN(tmp)) {
                                result[0] = 0;
                            }
                            numstack.push(tmp.toString());
                            break;
                        }
                    }
                }
            }

            double compute_result = Double.parseDouble(numstack.pop());

            if (!numstack.isEmpty()) {
                result[0] = 0;
            }

            double tmp = Math.round(compute_result);
            result[1] = (int) tmp;
            return result;
        } catch (Exception e) {
            return new int[]{0, 0};
        }

    }


    private static boolean isNumber(char ch) {
        return (int) ch >= 48 && (int) ch <= 57;
    }


    private static int getPriority(String str) {
        switch (str) {
            case "+":
            case "-":
                return 1;
            case "*":
            case "/":
                return 2;
            case "sin":
            case "tan":
            case "sqrt":
            case "cos":
                return 3;
            default:
                return 999;
        }
    }


    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        while (input.hasNextLine()) {
            double result = MathExpr.parse(input.nextLine());
            if (!Double.isNaN(result)) {
                System.out.println(Integer.parseInt(String.valueOf(Math.round(result))));
            } else {
                System.out.println("invalid");
            }
        }
    }


}