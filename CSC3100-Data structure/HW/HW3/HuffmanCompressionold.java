import java.util.Scanner;
import java.util.HashMap;
import java.util.Map;
import java.util.*;

public class HuffmanCompressionold{

    class HTreeNode{
        int freq;//频率
        Character  c;//代表的字符 只有叶节点才会有的
        String code;
        HTreeNode  parent;
        HTreeNode left;
        HTreeNode right;
    }
    Map<Character,String> codeMap = new HashMap<Character, String>();

    //对数组进行排序（冒泡）
    private HTreeNode[]  sort(HTreeNode[] node){
        for(int i=0;i<node.length;i++) {
            for(int j=i+1;j<node.length;j++) {
                if(node[i].freq > node[j].freq) {
                    HTreeNode temp = new HTreeNode();
                    temp = node[i];
                    node[i] = node[j];
                    node[j] = temp;
                }
            }
        }
        return node;
    }
    public  HTreeNode createHFMTree(List<Map.Entry<Character, Integer>> list){
        //将字符数组和权值数组合并到一起--节点数组
        HTreeNode[] node = new HTreeNode[(list).size()];
        for(int i=0;i<list.size();i++) {
            node[i] = new HTreeNode();
            node[i].c = list.get(i).getKey();
            node[i].freq =list.get(i).getValue();
        }
        while(node.length>1){
            HTreeNode[] da=sort(node);//排序 
            HTreeNode n1 = da[0];
            HTreeNode n2 = da[1];//用这两个节点，构成一个树

            //把这两个节点之和，再放入要排序的数组中
            HTreeNode Node = new HTreeNode();
            Node.left = n1;
            Node.right = n2;
            n1.parent = Node;n2.parent = Node;
            Node.freq = n1.freq+n2.freq;

            //删除n1、n2
            HTreeNode[] node2 = new HTreeNode[node.length-1];
            for(int i=2;i<node.length;i++) {
                node2[i-2] = node[i];
            }
            node2[node2.length-1] = Node;
            node = node2;
        }
        HTreeNode root = node[0];
        return root;//建好树的根节点;
    }

    public void makeTreeCode(HTreeNode root,String code){
        if(root != null) {
            root.code = code;
            makeTreeCode(root.left,code+"0");
            makeTreeCode(root.right,code+"1");
        }
    }
    public void makeCodeMap(HTreeNode root){
        if(root != null){
            if(root.right == null && root.left == null){
                codeMap.put(root.c,root.code);
            }
            if(root.left != null){
                makeCodeMap(root.left);
            }
            if(root.right != null){
                makeCodeMap(root.right);
            }
        }
    }
    
    public void printText(String str){
        List<Map.Entry<Character, String>> list_2 = new 
        ArrayList<Map.Entry<Character, String>>(codeMap.entrySet()); //转换为list
        list_2.sort(new Comparator<Map.Entry<Character, String>>() {
            public int compare(Map.Entry<Character, String> o1, Map.Entry<Character, String> o2) {
                return o1.getKey().compareTo(o2.getKey());
            }
        });
        String result = "";
        for(int i = 0; i < str.length();i++){
            result += codeMap.get(str.charAt(i));
        }
        System.out.println(result);
        for(int i=0;i<list_2.size();i++){
            int shu = (int)list_2.get(i).getKey();
            System.out.println(shu +":" +list_2.get(i).getValue() );}
    }

    public static void  main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        //System.out.print("请输入要压缩的字符串：");
        String str = scanner.nextLine();
        // 统计字符频率
        Map<Character,Integer> map = new HashMap<Character,Integer>();
        for(int i = 0; i < str.length(); i++){
            if(map.get(str.charAt(i))!=null) {
                map.put(str.charAt(i),map.get(str.charAt(i))+1);
            }
            else {
                map.put(str.charAt(i),1);
            }
        }
        HuffmanCompressionold root = new HuffmanCompressionold();
        List<Map.Entry<Character, Integer>> list_1 = new ArrayList<Map.Entry<Character, Integer>>(map.entrySet()); //转换为list
        list_1.sort(new Comparator<Map.Entry<Character, Integer>>() {
            public int compare(Map.Entry<Character, Integer> o1, Map.Entry<Character, Integer> o2) {
                return o1.getKey().compareTo(o2.getKey());
            }
        });
        HTreeNode node = root.createHFMTree(list_1);
        root.makeTreeCode(node,""); 
        root.makeCodeMap(node); 
        root.printText(str);
        long startTime = System.currentTimeMillis();
            // 执行需要计时的代码
            long endTime = System.currentTimeMillis();
            long duration = endTime - startTime;
            System.out.println("程序执行时间：" + duration + "毫秒");
    }
}
    
