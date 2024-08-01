import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;
import java.util.Map.Entry;

public class chatgpt1{

    static class HTreeNode {
        int freq; // 频率
        Character c; // 代表的字符，只有叶节点才会有的
        String code;
        HTreeNode parent;
        HTreeNode left;
        HTreeNode right;
    }

    static Map<Character, String> codeMap = new HashMap<>();

    public static HTreeNode createHFMTree(List<Entry<Character, Integer>> list) {
        // 将字符数组和权值数组合并到一起--节点数组
        HTreeNode[] node = new HTreeNode[list.size()];
        for (int i = 0; i < list.size(); i++) {
            node[i] = new HTreeNode();
            node[i].c = list.get(i).getKey();
            node[i].freq = list.get(i).getValue();
        }
        while (node.length > 1) {
            HTreeNode[] da = sort(node); // 排序
            HTreeNode n1 = da[0];
            HTreeNode n2 = da[1]; // 用这两个节点，构成一个树

            // 把这两个节点之和，再放入要排序的数组中
            HTreeNode Node = new HTreeNode();
            Node.left = n1;
            Node.right = n2;
            n1.parent = Node;
            n2.parent = Node;
            Node.freq = n1.freq + n2.freq;

            // 删除n1、n2
            node = Arrays.copyOfRange(node, 2, node.length);
            node = Arrays.copyOf(node, node.length + 1);
            node[node.length - 1] = Node;
        }
        HTreeNode root = node[0];
        return root; // 建好树的根节点
    }

    private static HTreeNode[] sort(HTreeNode[] node) {
        Arrays.sort(node, Comparator.comparingInt(o -> o.freq));
        return node;
    }

    public static void makeTreeCode(HTreeNode root, String code) {
        if (root != null) {
            root.code = code;
            makeTreeCode(root.left, code + "0");
            makeTreeCode(root.right, code + "1");
        }
    }

    public static void makeCodeMap(HTreeNode root) {
        if (root != null) { // 修改了这里的判断条件
            if (root.left == null && root.right == null) {
                codeMap.put(root.c, root.code);
            } else {
                makeCodeMap(root.left);
                makeCodeMap(root.right);
            }
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String str = br.readLine();
    
        // 统计字符频率
        Map<Character, Integer> map = new HashMap<>();
        StringBuilder sb = new StringBuilder(str);
        for (int i = 0; i < sb.length(); i++) {
            char c = sb.charAt(i);
            map.put(c, map.getOrDefault(c, 0) + 1);
        }
    
        List<Map.Entry<Character, Integer>> list = new ArrayList<>(map.entrySet());
        list.sort(Comparator.comparing(Map.Entry::getValue));
    
        HTreeNode root = createHFMTree(list);
        makeTreeCode(root, "");
        makeCodeMap(root);
    
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < sb.length(); i++) {
            result.append(codeMap.get(sb.charAt(i)));
        }
        System.out.println(result);
    
        Map<Character, String> sortedMap = new TreeMap<>();
        for (Map.Entry<Character, String> entry : codeMap.entrySet()) {
            sortedMap.put(entry.getKey(), entry.getValue());
        }
        for (Map.Entry<Character, String> entry : sortedMap.entrySet()) {
            int ascii = (int) entry.getKey();
            System.out.println(ascii + ":" + entry.getValue());
        }
    }
}    
       
