public class Conditional{
    public static void main(String[] args){
        int a = 5;
        int b = 3;
        int max;
        boolean booleanExpression = (a > b);
        if(booleanExpression){
            max = a;
        }else{
            max = b;
        }
        System.out.println(max);

        if (!booleanExpression){
            System.out.println("a <= b");
        }    
    }
}
