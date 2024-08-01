import java.util.*;

public class HuffmanCompression {

    static class HTreeNode {
        int freq;
        Character c;
        String code;
        HTreeNode parent;
        HTreeNode left;
        HTreeNode right;
    }

    static Map<Character, String> codeMap = new HashMap<>();

    public static HTreeNode createHFMTree(int[] freqs) {
        PriorityQueue<HTreeNode> pq = new PriorityQueue<>(Comparator.comparingInt(node -> node.freq));
        for (int i = 0; i < freqs.length; i++) {
            if (freqs[i] > 0) {
                HTreeNode node = new HTreeNode();
                node.c = (char) i;
                node.freq = freqs[i];
                pq.offer(node);
            }
        }
        while (pq.size() > 1) {
            HTreeNode n1 = pq.poll();
            HTreeNode n2 = pq.poll();
            HTreeNode Node = new HTreeNode();
            Node.left = n1;
            Node.right = n2;
            n1.parent = Node;
            n2.parent = Node;
            Node.freq = n1.freq + n2.freq;
            pq.offer(Node);
        }
        return pq.poll();
    }

    public static void makeCodeMap(HTreeNode root, String code) {
        if (root == null) {
            return;
        }
        if (root.left == null && root.right == null) {
            codeMap.put(root.c, code);
        } else {
            makeCodeMap(root.left, code + "0");
            makeCodeMap(root.right, code + "1");
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String str = scanner.nextLine();

        // 统计字符频率
        int[] freqs = new int[256];
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            freqs[c]++;
        }

        HTreeNode root = createHFMTree(freqs);
        makeCodeMap(root, "");

        StringBuilder result = new StringBuilder();
        for (int i = 0; i < str.length(); i++) {
            result.append(codeMap.get(str.charAt(i)));
        }
        System.out.println(result);
        for (Map.Entry<Character, String> entry : codeMap.entrySet()) {
            int ascii = (int) entry.getKey();
            System.out.println(ascii + ":" + entry.getValue());
        }
        
    }
}