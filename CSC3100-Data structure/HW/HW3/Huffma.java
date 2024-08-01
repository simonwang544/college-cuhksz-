import java.util.Scanner;
import java.util.HashMap;

public class Huffma{
    
    // 节点类
    static class Node implements Comparable<Node>{
        char ch;
        int freq;
        Node left, right;
        
        Node(char ch, int freq){
            this.ch = ch;
            this.freq = freq;
            left = null;
            right = null;
        }
        
        @Override
        public int compareTo(Node o) {
            return this.freq - o.freq;
        }
    }
    
    // 构建哈夫曼树
    public static Node buildHuffmanTree(int[] freq){
        PriorityQueue<Node> pq = new PriorityQueue<>();
        for(int i=0; i<256; i++){
            if(freq[i] > 0){
                pq.offer(new Node((char)i, freq[i]));
            }
        }
        while(pq.size() > 1){
            Node left = pq.poll();
            Node right = pq.poll();
            Node parent = new Node('\0', left.freq + right.freq);
            parent.left = left;
            parent.right = right;
            pq.offer(parent);
        }
        return pq.poll();
    }
    
    // 生成编码字典
    public static void generateCode(Node root, String code, HashMap<Character, String> map){
        if(root == null){
            return;
        }
        if(root.left == null && root.right == null){
            map.put(root.ch, code);
            return;
        }
        generateCode(root.left, code+"0", map);
        generateCode(root.right, code+"1", map);
    }
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("请输入要压缩的字符串：");
        String str = scanner.nextLine();

        // 统计字符频率
        int[] freq = new int[256];
        for(int i=0; i<str.length(); i++){
            freq[str.charAt(i)]++;
        }
        
        // 构建哈夫曼树
        Node root = buildHuffmanTree(freq);
        
        // 生成编码字典
        HashMap<Character, String> map = new HashMap<>();
        generateCode(root, "", map);
        
        // 压缩字符串
        StringBuilder sb = new StringBuilder();
        for(int i=0; i<str.length(); i++){
            sb.append(map.get(str.charAt(i)));
        }
        String compressedStr = sb.toString();
        
        // 输出压缩后的字符串
        System.out.println("压缩后的字符串：" + compressedStr);
        
        // 输出编码字典
        System.out.println("编码字典：");
        for(int i=0; i<256; i++){
            if(map.containsKey((char)i)){
                System.out.println((char)i + "(" + i + ")" + ": " + map.get((char)i));
            }
        }
    }
}
