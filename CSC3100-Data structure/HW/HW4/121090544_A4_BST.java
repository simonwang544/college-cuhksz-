import java.util.Scanner;

public class BST {
    
    private static class Node {
        int data;
        Node left;
        Node right;
        
        Node(int data) {
            this.data = data;
            left = null;
            right = null;
        }
    }
    
    private Node root;
    
    public BST() {
        root = null;
    }
    
    public void insert(int data) {
        root = insertHelper(root, data);
    }
    
    private Node insertHelper(Node current, int data) {
        if (current == null) {
            return new Node(data);
        }
        if (data < current.data) {
            current.left = insertHelper(current.left, data);
        } else if (data > current.data) {
            current.right = insertHelper(current.right, data);
        }
        return current;
    }
    
    public void inorderTraversal() {
        inorderHelper(root);
        System.out.println();
    }
    
    private void inorderHelper(Node current) {
        if (current != null) {
            inorderHelper(current.left);
            System.out.print(current.data + " ");
            inorderHelper(current.right);
        }
    }
    
    public void preorderTraversal() {
        preorderHelper(root);
        System.out.println();
    }
    
    private void preorderHelper(Node current) {
        if (current != null) {
            System.out.print(current.data + " ");
            preorderHelper(current.left);
            preorderHelper(current.right);
        }
    }
    
    public void postorderTraversal() {
        postorderHelper(root);
        System.out.println();
    }
    
    private void postorderHelper(Node current) {
        if (current != null) {
            postorderHelper(current.left);
            postorderHelper(current.right);
            System.out.print(current.data + " ");
        }
    }
    
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        BST tree = new BST();
        String[] values = input.nextLine().split("\\s+");
        for (String value : values) {
            tree.insert(Integer.parseInt(value));
        }
        
        tree.inorderTraversal();
        
        tree.preorderTraversal();
        
        tree.postorderTraversal();
    }
}
