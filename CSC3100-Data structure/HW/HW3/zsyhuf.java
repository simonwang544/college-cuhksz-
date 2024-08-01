import java.util.*;

public class zsyhuf {
    static class HTreeNode{
        int freq;//频率
        Character c;//代表的字符 只有叶节点才会有的
        String code;
        HTreeNode parent;
        HTreeNode left;
        HTreeNode right;
    }
    static Map<Character,String> codeMap = new HashMap<Character, String>();

    //对数组进行排序（冒泡）
    private static HTreeNode[] sort(HTreeNode[] node){
        for(int i=0;i<node.length;i++) {
            for(int j=i+1;j<node.length;j++) {
                if(node[i].freq > node[j].freq) {
                    HTreeNode temp = node[i];
                    node[i] = node[j];
                    node[j] = temp;
                }
            }
        }
        return node;
    }

    public static HTreeNode createHFMTree(List<Map.Entry<Character, Integer>> list){
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

    public static void makeTreeCode(HTreeNode root,String code){
        if(root != null) {
            root.code = code;
            makeTreeCode(root.left,code+"0");
            makeTreeCode(root.right,code+"1");
        }
    }

    public static void makeCodeMap(HTreeNode root){
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

    public static void printText(String str){
        String result = "";
        for(int i = 0; i < str.length();i++){
            result += codeMap.get(str.charAt(i));
        }
        System.out.println(result);
        for(Character i : codeMap.keySet()){
            System.out.println( (int)i + ":"+ codeMap.get(i));
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
