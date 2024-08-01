import java.util.Scanner;

public class Vector {
    private final int[] elements;

    public Vector(int[] elements) {
        this.elements = elements;
    }

    public static Vector plus(Vector v1, Vector v2) {
        if (v1.elements.length != v2.elements.length) {
            throw new IllegalArgumentException("Vectors have different dimensions.");
        }
        int[] result = new int[v1.elements.length];
        for (int i = 0; i < result.length; i++) {
            result[i] = v1.elements[i] + v2.elements[i];
        }
        return new Vector(result);
    }

    public static Vector subtract(Vector v1, Vector v2) {
        if (v1.elements.length != v2.elements.length) {
            throw new IllegalArgumentException("Vectors have different dimensions.");
        }
        int[] result = new int[v1.elements.length];
        for (int i = 0; i < result.length; i++) {
            result[i] = v1.elements[i] - v2.elements[i];
        }
        return new Vector(result);
    }

    public Vector multiply(int a) {
        int[] result = new int[elements.length];
        for (int i = 0; i < elements.length; i++) {
            result[i] = elements[i] * a;
        }
        return new Vector(result);
    }

    // Overloaded norm method for infinity norm
    public double norm() {
        int max = 0;
        for (int element : elements) {
            max = Math.max(max, Math.abs(element));
        }
        return max;
    }

    public double norm(int p) {
        if (p <= 0) {
            return norm(); // Defaults to infinity norm
        }
        double sum = 0;
        for (int element : elements) {
            sum += Math.pow(Math.abs(element), p);
        }
        return Math.pow(sum, 1.0 / p);
    }

    public static int dot(Vector v1, Vector v2) {
        if (v1.elements.length != v2.elements.length) {
            throw new IllegalArgumentException("Vectors have different dimensions.");
        }
        int result = 0;
        for (int i = 0; i < v1.elements.length; i++) {
            result += v1.elements[i] * v2.elements[i];
        }
        return result;
    }

    public static double angle(Vector v1, Vector v2) {
        if (v1.norm() == 0 || v2.norm() == 0) {
            throw new ArithmeticException("Angle is undefined for zero vector.");
        }
        double dotProduct = dot(v1, v2);
        double magnitudeProduct = v1.norm(2) * v2.norm(2);
        return Math.acos(dotProduct / magnitudeProduct);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("(");
        for (int i = 0; i < elements.length; i++) {
            sb.append(elements[i]);
            if (i < elements.length - 1) {
                sb.append(", ");
            }
        }
        sb.append(")");
        return sb.toString();
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        Vector[] vectors = new Vector[n];

        for (int i = 0; i < n; i++) {
            int size = scanner.nextInt();
            int[] elements = new int[size];
            for (int j = 0; j < size; j++) {
                elements[j] = scanner.nextInt();
            }
            vectors[i] = new Vector(elements);
        }

        while (scanner.hasNext()) {
            String operation = scanner.next();
            int index;
            switch (operation) {
                case "plus":
                    System.out.println(plus(vectors[scanner.nextInt()], vectors[scanner.nextInt()]));
                    break;
                case "subtract":
                    System.out.println(subtract(vectors[scanner.nextInt()], vectors[scanner.nextInt()]));
                    break;
                case "multiply":
                    System.out.println(vectors[scanner.nextInt()].multiply(scanner.nextInt()));
                    break;
                case "norm":
                    index = scanner.nextInt();
                    if (scanner.hasNextInt()) {
                        System.out.println(vectors[index].norm(scanner.nextInt()));
                    } else {
                        scanner.next(); // Consume the word "infinity"
                        System.out.println(vectors[index].norm());
                    }
                    break;
                case "dot":
                    System.out.println(dot(vectors[scanner.nextInt()], vectors[scanner.nextInt()]));
                    break;
                case "angle":
                    System.out.println(angle(vectors[scanner.nextInt()], vectors[scanner.nextInt()]));
                    break;
                default:
                    System.out.println("Invalid operation");
                    break;
            }
        }

        scanner.close();
    }
}
