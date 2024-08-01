
public class lec_five_Demo{
    class Node {
        int date;
        Node left = null;
        Node right = null;
    }
    public boolean search(Node root , int query){
            if (root == null)return false;
            else if (query < root.data){
                return search(root.right, query);
            }
            else if(query > root.data){
                return search(root.left, query);
            }
        }
    public static void main(String[]args){
            Node root = new Node(); root.data = 30;
            root.left = new Node(); root.left.data = 15;
            root.right = new Node(); root.right.data = 60;
            root.left.left = new Node(); root.left.left.data = 7;

        }
    }
    

