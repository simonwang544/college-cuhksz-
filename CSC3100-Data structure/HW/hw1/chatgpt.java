import java.util.*;
import java.lang.Math;

public class chatgpt {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a trigonometric function: ");
        String function = sc.nextLine();
        double result = evaluateTrigFunction(function);
        System.out.println("Result: " + result);
    }

    public static double evaluateTrigFunction(String function) {
        Stack<Character> opStack = new Stack<>();
        Stack<Double> numStack = new Stack<>();

        for (int i = 0; i < function.length(); i++) {
            char c = function.charAt(i);
            if (Character.isDigit(c) || c == '.') {
                StringBuilder sb = new StringBuilder();
                while (i < function.length() && (Character.isDigit(function.charAt(i)) || function.charAt(i) == '.')) {
                    sb.append(function.charAt(i));
                    i++;
                }
                i--;
                double num = Double.parseDouble(sb.toString());
                numStack.push(num);
            } else if (c == ' ') {
                continue;
            } else if (c == '(') {
                opStack.push(c);
            } else if (c == ')') {
                while (opStack.peek() != '(') {
                    double num2 = numStack.pop();
                    double num1 = numStack.pop();
                    char op = opStack.pop();
                    double result = applyOp(num1, num2, op);
                    numStack.push(result);
                }
                opStack.pop();
            } else if (c == 's' || c == 'c' || c == 't') {
                char func = c;
                i += 2;
                double num = 0;
                if (function.charAt(i-1) == 's') {
                    num = Math.sin(evaluateTrigFunction(function.substring(i)));
                } else if (function.charAt(i-1) == 'c') {
                    num = Math.cos(evaluateTrigFunction(function.substring(i)));
                } else if (function.charAt(i-1) == 't') {
                    num = Math.tan(evaluateTrigFunction(function.substring(i)));
                }
                numStack.push(num);
                i += Integer.toString((int)num).length() - 1;
            }
        }

        while (!opStack.isEmpty()) {
            double num2 = numStack.pop();
            double num1 = numStack.pop();
            char op = opStack.pop();
            double result = applyOp(num1, num2, op);
            numStack.push(result);
        }

        return numStack.pop();
    }

    public static boolean hasPrecedence(char op1, char op2) {
        if (op2 == '(' || op2 == ')') {
            return false;
        }
        if ((op1 == '*' || op1 == '/') && (op2 == '+' || op2 == '-')) {
            return false;
        }
        return true;
    }

    public static double applyOp(double num1, double num2, char op) {
        switch(op) {
            case '+':
                return num1 + num2;
            case '-':
                return num1 - num2;
            case '*':
                return num1 * num2;
            case '/':
                if (num2 == 0) {
                    throw new UnsupportedOperationException("Cannot divide by zero");
                }
                return num1 / num2;
            default:
                throw new IllegalArgumentException("Invalid operator: " + op);
        }
    }
}