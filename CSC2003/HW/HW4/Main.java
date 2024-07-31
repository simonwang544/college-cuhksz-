import java.util.*;

abstract class SortStrategy {
    abstract void sort(String[] items, char c);
}

// Here's you need to implement the three sort strategies
// char c may be unused in some of the strategies

class StringSorter {

    private SortStrategy strategy;

    public StringSorter(SortStrategy strategy) {
        // Here's the constructor to implement

    }

    public void sortContent(String[] Strings, char c) throws IOException {
        // Here's the function to implement

    }
}

class Main {

    // Here's the input and output function
    // DO NOT modify this class

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String firstLine = scanner.nextLine();
        int t = Integer.parseInt(firstLine.split(" ")[0]);
        int n = Integer.parseInt(firstLine.split(" ")[1]);
        String[] items = new String[n];
        for (int i = 0; i < n; i++) items[i] = scanner.nextLine();
        char c = ' ';
        if (t == 3) c = scanner.nextLine().charAt(0);
        StringSorter sorter;
        switch (t) {
            case 1:
                sorter = new StringSorter(new AlphabeticalSort());
                break;
            case 2:
                sorter = new StringSorter(new LengthOrderSort());
                break;
            case 3:
                sorter = new StringSorter(new CharacterFrequencySort());
                break;
            default:
                sorter = new StringSorter(new AlphabeticalSort());
                break;
        }
        sorter.sortContent(items, c);
        for (String item : items) {
            System.out.println(item);
        }
        scanner.close();
    }

}