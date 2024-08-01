public class Narcissistic {
    void nar(){
        boolean flag = false;
        for(int i = 100; i <= 999; i++){
            int m = i % 10;
            int n = i / 10 % 10;
            int p = i / 100;
            if (m * m * m + n * n * n + p * p * p == i){
                if(flag){
                    System.out.print(", ");
                }
                System.out.print(i);
                flag = true;
            }
        }
        System.out.println();
    }

    void narPlus(int n){
        boolean flag = false;
        for(int i = 100; i < n; i++){
            int numOfDigits = 0;
            int j = i;
            while(j != 0){
                j = j / 10;
                numOfDigits++;
            }
            int sum = 0;
            j = i;
            while(j != 0){
                int mod = j % 10;
                int mult = 1;
                for(int k = 0; k < numOfDigits; k++){
                    mult = mult * mod;
                }
                sum += mult;
                j = j / 10;
            }
            if (sum == i){
                if(flag){
                    System.out.print(", ");
                }
                System.out.print(i);
                flag = true;
            }
        }
        System.out.println();
    }
    public static void main(String[] args) {
        Narcissistic narcis = new Narcissistic();
        narcis.nar();
        narcis.narPlus(1000);
    }

}
