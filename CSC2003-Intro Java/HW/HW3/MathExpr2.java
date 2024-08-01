import java.util.Scanner;

public class MathExpr2 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int testCases = Integer.parseInt(scanner.nextLine().trim());

        for (int i = 0; i < testCases; i++) {
            String expression = scanner.nextLine().trim().replaceAll("\\s+", "");//删除空格
            double result = new ExpressionParser(expression).parse();//调用parse来计算结果
            System.out.println((int) Math.round(result));//将结果四舍五入
        }
        scanner.close();
    }

    static class ExpressionParser {
        private final String input;
        private int index;
        private char currentChar;

        public ExpressionParser(String input) {
            this.input = input;
            this.index = -1;
            moveToNextChar();//初始化“input”字段，将“index”设置为-1，并移动到输入的第一个字符。
        }

        public double parse() {
            double result = parseExpression();
            if (index < input.length()) {//检查输入中是否有多余字符。
                throw new RuntimeException("Unexpected character found: " + currentChar);//如果有未处理的字符，则抛出异常
            }
            return result;
        }

        private void moveToNextChar() {
            currentChar = (++index < input.length()) ? input.charAt(index) : '\0';//增加 `index` 并使用下一个字符更新 `currentChar`，或者如果到达字符串末尾，则将其设置为空字符。
        }

        private boolean accept(char c) {
            while (currentChar == ' ') moveToNextChar();//在检查字符之前跳过任何空格
            if (currentChar == c) {//检查当前字符是否是预期字符。
                moveToNextChar();
                return true;
            }
            return false;
        }

        private double parseExpression() {
            double result = parseTerm();//首先解析一个术语并将其存储在“结果”中
            while (true) {
                if (accept('+')) {//无限循环以处理由 + 或 - 连接的多个项
                    result += parseTerm(); // addition
                } else if (accept('-')) {
                    result -= parseTerm(); // 从“结果”中减去下一项的结果。
                } else {
                    return result;
                }
            }
        }

        private double parseTerm() {
            double result = parseFactor();
            while (true) {
                if (accept('*')) {
                    result *= parseFactor(); // multiplication
                } else if (accept('/')) {
                    result /= parseFactor(); // division
                } else {
                    return result;
                }
            }
        }

        private double parseFactor() {
            if (accept('+')) return parseFactor(); // unary plus
            if (accept('-')) return -parseFactor(); // unary minus

            double result;
            int startPos = this.index;
            if (accept('(')) { // parentheses
                result = parseExpression();
                accept(')');
            } else if (currentChar >= '0' && currentChar <= '9' || currentChar == '.') { // numbers
                while (currentChar >= '0' && currentChar <= '9' || currentChar == '.') moveToNextChar();
                result = Double.parseDouble(input.substring(startPos, this.index));
            } else if (Character.isLetter(currentChar)) { // functions
                while (Character.isLetter(currentChar)) moveToNextChar();
                String func = input.substring(startPos, this.index);
                result = parseFactor();
                result = applyFunction(func, result);
            } else {
                throw new RuntimeException("Unexpected character: " + currentChar);
            }
            return result;
        }

        private double applyFunction(String func, double argument) {
            if (func.equals("sin")) {
                return Math.sin(argument);
            } else if (func.equals("cos")) {
                return Math.cos(argument);
            } else if (func.equals("tan")) {
                return Math.tan(argument);
            } else if (func.equals("sqrt")) {
                return Math.sqrt(argument);
            } else {
                throw new RuntimeException("Unknown function: " + func);
            }
        }
    }
}
