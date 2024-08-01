import java.util.Scanner;

public class MathExpression {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Read the number of test cases
        int N = Integer.parseInt(scanner.nextLine());

        for (int i = 0; i < N; i++) {
            // Read each expression and split into parts
            String[] parts = scanner.nextLine().split(" ");
            int a = Integer.parseInt(parts[0]);
            char operator = parts[1].charAt(0);
            int b = Integer.parseInt(parts[2]);
            int result = 0;

            // Perform the operation 
            switch (operator) {
                case '+':
                    result = a + b;
                    break;
                case '-':
                    result = a - b;
                    break;
                case '*':
                    result = a * b;
                    break;
                case '/':
                    result = a / b; 
                    break;
            }

            // Print the result of each operation
            System.out.println(result);
        }

        scanner.close();
    }
}
