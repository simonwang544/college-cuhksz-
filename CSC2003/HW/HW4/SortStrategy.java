import java.util.*;  //用于对数组进行排序和定义自定义比较逻辑的 `Arrays` 和 `Comparator` 类。
import java.io.IOException;  //这是 Java 中的一个异常类，用于处理 I/O 错误，可能由输入/输出操作引发

abstract class SortStrategy {
    //定义 `sort` 方法的抽象类。 该方法是抽象的，这意味着它在该类中没有实现，但必须由任何子类实现。 此类构成了用于排序的策略模式的基础。
    abstract void sort(String[] items, char c);
}
//SortStrategy 的每个子类都提供特定的排序实现
//第一个排序方式：按字母顺序排列
class AlphabeticalSort extends SortStrategy {
    @Override  //一个注释，指示此方法重写超类 (`SortStrategy`) 中的方法。 这用于确保方法签名匹配，提供编译时检查。
    void sort(String[] items, char c) {
        Arrays.sort(items, new Comparator<String>() {//从 `Arrays` 类调用静态方法 `sort`，该方法对给定数组 `items` 进行排序。
                                                    //它使用内联定义的自定义比较器 （为“String”对象实现“Comparator”接口的匿名内部类）
                                                    //比较器指示在排序过程中如何比较数组中的元素。
            @Override //表示该方法覆盖`Comparator`接口的`compare`方法
            public int compare(String s1, String s2) {// `compare` 方法定义如何比较两个字符串 `s1` 和 `s2`。 返回值是一个整数，表示顺序：
                                                        // - 如果为负，则“s1”小于“s2”。
                                                        //- 如果为零，则“s1”等于“s2”。
                                                        //- 如果为正，则“s1”大于“s2”。
                return s1.compareTo(s2); //String.compareTo` 是一种按字典顺序比较两个字符串的方法。 
                                        //当“s1”小于、等于或大于“s2”时，它返回负整数、零或正整数。 这个结果直接决定了排序数组中字符串的顺序。
            }
        });
    }
}

class LengthOrderSort extends SortStrategy {//class LengthOrderSort`：这声明了一个名为“LengthOrderSort”的新类。
                                            // `extends SortStrategy`：表明`LengthOrderSort`是抽象类`SortStrategy`的子类。 
                                            //通过扩展“SortStrategy”，“LengthOrderSort”继承了它的结构并且必须实现它的抽象方法。
    @Override
    void sort(String[] items, char c) {
        Arrays.sort(items, Comparator.comparingInt(String::length));//使用将每个字符串映射到其长度的比较器，根据字符串的长度对字符串数组进行排序。
                                                                    //Comparator.comparingInt(String::length)`：这将创建一个比较器，
                                                                    //从数组中的每个字符串中提取整数排序键，在本例中是字符串的长度。 
                                                                    //`String::length` 是一个方法引用，它对每个字符串调用 `length()` 方法来确定其长度。
    }
}

class CharacterFrequencySort extends SortStrategy {
    @Override
    void sort(String[] items, char c) {
        Arrays.sort(items, new Comparator<String>() {//使用 Java 标准库中的 `Arrays.sort` 方法对数组 `items` 进行排序。
                                                    //它指定一个由匿名定义的新比较器 为“String”对象实现“Comparator”接口的内部类。
            @Override
            public int compare(String s1, String s2) {
                long count1 = s1.chars().filter(ch -> ch == c).count();
                //`s1.chars()` 将字符串转换为字符流，`filter(ch -> ch == c)` 只保留与 `c` 匹配的字符，而 `count()` 对它们进行计数。
                long count2 = s2.chars().filter(ch -> ch == c).count();
                return count1 != count2 ? Long.compare(count1, count2) : 0;
                //如果“count1”和“count2”不同（“count1！= count2”），则使用“Long.compare(count1, count2)”来确定哪个计数更大。 
                //如果“count1”更大，则返回正值； 如果小于，则为负值。
                //如果“count1”和“count2”相等，则返回“0”，表示按照指定的排序标准相等。
            }
        });
    }
}

class StringSorter {

    private SortStrategy strategy;

    public StringSorter(SortStrategy strategy) {
        this.strategy = strategy;
    }

    public void sortContent(String[] items, char c) {
        strategy.sort(items, c);
    }
}

class Main {

    public static void main(String[] args) throws IOException {
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
