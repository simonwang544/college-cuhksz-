import java.util.*;
public class TestMathExpr {
    public static boolean estimate(String str){
        if (!isValid(str)){//System.out.println("Invalid 9191"); 
        return false;}
        //判断输入是否错误
        //先判断存在空格的错误，再去掉空格判断错误。
        //小数点和数字之间有空格
        if (str.length() > 1) {
            for (int i = 0; i < str.length(); i++) {
            //不是这一堆数的invalid
            if("+-*/0123456789sincotaqr. ()".indexOf(str.charAt(i)) < 0) {
                //System.out.println("Invalid 字符不对"); 
                return false; }
            if (str.charAt(i) == '.') {
                   if(i==0) {//System.out.println("Invalid 。不能在开头");
                   return false;} //不能出现在开头
                   if(i==str.length()-1) {
                    //System.out.println("Invalid 。不能在结尾");
                    return false;} //不能出现在开头
                   if ((i > 0) && ((str.charAt(i-1)==' ')||(str.charAt(i+1)==' '))){
                    //System.out.println("Invalid 点周围不能有空格");
                    return false;}
                }
            }

        //sin tan等符号内部有空格
            for (int i = 0; i < str.length(); i++) {
                if ((str.charAt(i) == 's')&&((!str.substring(i, i+3).equals("sin"))&&(!str.substring(i, i+4).equals("sqrt")))&&(!str.substring(i+1, i+2).equals("("))){
                    //System.out.println("Invalid 不连续的特殊运算");
                    return false;}
                if ((str.charAt(i) == 'c')&&(!str.substring(i, i+3).equals("cos"))) {
                    //System.out.println("Invalid 不连续的特殊运算");
                    return false;}
                if ((str.charAt(i) == 't')&&(!str.substring(i, i+3).equals("tan"))&&(!str.substring(i+1, i+2).equals("("))) {
                    //System.out.println("Invalid 不连续的特殊运算");
                    return false;}
            }
        }
        //数字之间没有符号，只有空格
        int cnt_a = 0;
        int cnt_b = 0;
        Boolean flag = false;
        //有小数点的时候可以去空格
        /*if (str.contains(".")){*/
        //先去掉头尾空格，如果不符合数字格式就进行下一步
            String new_s_pre = str.trim();
            //System.out.println("qutouwei fuheshuzi" + new_s_pre.matches("-?\\d+(\\.\\d+)?"));
            if(new_s_pre.matches("-?\\d+(\\.\\d+)?")) {return true;}
            if (!new_s_pre.matches("-?\\d+(\\.\\d+)?")) {
            String new_s = str.replaceAll(" ", "");
                for (int ii= 0; ii < new_s.length(); ii++){
                   if ("+-*/".indexOf(new_s.charAt(ii)) >= 0) {cnt_a += 1;}
                   if (ii < new_s.length() - 4) {
                       //System.out.println(new_s.substring(ii, ii + 3));
                       if (new_s.substring(ii, ii + 3).equals("sin") || (new_s.substring(ii, ii + 3).equals("cos"))||(new_s.substring(ii, ii + 3).equals("tan"))||(new_s.substring(ii, ii + 4).equals("sqrt"))){
                        if (ii >= str.length()- 5){//System.out.println("Invalid 特殊运算靠后");
                        return false;}
                        if (ii==0) {flag = true;}
                           cnt_b += 1;}
                   }
                }
                if ((!flag)&&(cnt_a==0)) {
                    //System.out.println("Invalid 无加减乘除");
                    return false;}
                if(str.contains("sin")&&(!str.contains("("))) {
                    //System.out.println("Invalid 特殊运算");
                    return false;}
                if(str.contains("cos")&&(!str.contains("("))) {
                    //System.out.println("Invalid 特殊运算");
                    return false;}
                if(str.contains("tan")&&(!str.contains("("))) {
                    //System.out.println("Invalid 特殊运算");
                    return false;}
                if(str.contains("sqrt")&&(!str.contains("("))) {//System.out.println("Invalid 特殊运算");
                    return false;}
               }

        
        //sqrt里面的东西小于0,在后面判断了
        //去掉空格判断错误
        //少一个：连续的符号
        str = str.replaceAll(" ", "");
        int i = 0;
        if (str.length() == 1){
            //当只有一位字符时，只能是“0123456789”中的一个
            if ("0123456789".indexOf(str.charAt(0)) == -1){
             //System.out.println("Invalid 1111");
                return false;
            }
        }
        if (str.length() > 1){
            for (i = 0; i < str.length() - 1; i++) {
                //第一个字符只能为"-sctg(0123456789"中的一个因为求根开头是s
                if ("-sct(0123456789".indexOf(str.charAt(0)) == -1){
                 //System.out.println("Invalid 2222");
                 return false;
                }
                //“+-*/”后面只能是"0123456789sct("中的一个
                if ("+-*/".indexOf(str.charAt(i)) >= 0 && "0123456789sct(".indexOf(str.charAt(i + 1)) == -1){
                 //System.out.println("Invalid 3333");
                 return false;
                }
                if (i>0){
                if ("+-*/".indexOf(str.charAt(i)) >= 0 && "0123456789snt)(".indexOf(str.charAt(i - 1)) == -1){
                    //System.out.println("Invalid 3333");
                    return false;
                   }}
                //"."后面只能是“0123456789”中的一个
                if (str.charAt(i) == '.' && "0123456789".indexOf(str.charAt(i + 1)) == -1){
                 //System.out.println("Invalid 4444");
                 return false;
                }
  
                //"0"的判断操作
                if (str.charAt(0) == '0' && str.charAt(1) == '0'){
                 //System.out.println("Invalid 5555");
                 return false;
                }
                if (i >= 1 && str.charAt(i) == '0'){
                    //&& str.charAt(0) == '0' && str.charAt(1) == '0'
                    int m = i;
                    int n = i;
                    int k_idx = 0;
                    //当0的上一个字符不为"0123456789."时，后一位只能是“+-*/.)”中的一个
                    if ("0123456789.".indexOf(str.charAt(m - 1)) == -1 && "+-*/.)".indexOf(str.charAt(i + 1)) == -1){
                     //System.out.println("Invalid 6666");
                     return false;
                    }
                    //如果0的上一位为“.”,则后一位只能是“0123456789+-*/.)”中的一个
                  if (str.charAt(m - 1) == '.' && "0123456789+-*/.)".indexOf(str.charAt(i + 1)) == -1){
                    //System.out.println("Invalid 7777");
                    return false;
                   }
                   //这是在干嘛 计算0到上一个运算符之间有无.
                   n -= 1;
                   while (n > 0){
                       if ("(+-*/sct".indexOf(str.charAt(n)) >= 0){
                           break;
                       }
                       if (str.charAt(n) == '.'){
                           k_idx++;
                       }
                       n--;
                   }
 
                   //如果0到上一个运算符之间没有“.”的话，整数位第一个只能是“123456789”，
                   //  且后一位只能是“0123456789+-*/.)”中的一个。
                   if ((k_idx == 0 && str.charAt(n) == '0') || "0123456789+-*/.)".indexOf(str.charAt(i + 1)) == -1){
                       //System.out.println("Invalid 8888");
                       return false;
                   }
                   //如果0到上一个运算符之间有一个“.”的话,则后一位只能是“0123456789+-*/.)”中的一个
                   if (k_idx == 1 && "0123456789+-*/.)".indexOf(str.charAt(i + 1)) == -1){
                       //System.out.println("Invalid 9999");
                       return false;
                   }
                   if (k_idx > 1){
                       //System.out.println("Invalid 0000");
                       return false;
                   }
 
               }
               //"123456789"后面只能是“0123456789+-*/.)”中的一个
               if ("123456789".indexOf(str.charAt(i)) >= 0 && "0123456789+-*/.)".indexOf(str.charAt(i + 1)) == -1){
                   //System.out.println("Invalid 123");
                   return false;
               }
               //"("后面只能是“-0123456789cst(”中的一个
               if (str.charAt(i) == '(' && "-0123456789cst()".indexOf(str.charAt(i + 1)) == -1){
                   //System.out.println("Invalid 456");
                   return false;
               }
               //")"后面只能是“+-*/)”中的一个
               if (str.charAt(i) == ')' && "+-*/)".indexOf(str.charAt(i + 1)) == -1){
                //System.out.println("Invalid 789");
                return false;
            }
            //最后一位字符只能是“0123456789)”中的一个
            if ("0123456789)".indexOf(str.charAt(str.length() - 1)) == -1){
                //System.out.println("Invalid 1212");
                return false;
            }
            //不能有连续的多个“.”
            if (i > 2 && str.charAt(i) == '.'){
                int n = i - 1;
                int k_idx = 0;
                while (n > 0){
                    if ("(+-*/gsct".indexOf(str.charAt(n)) >= 0){
                        break;
                    }
                    if (str.charAt(n) == '.'){
                        k_idx++;
                    }
                    n--;
                }
                if (k_idx > 0){
                    //System.out.println("Invalid 1313");
                    return false;
                }
            }
        }
    }
    return true;
}
    public static boolean isValid(String str) {//判断括号左右对不对，或者字符是否为空
        if(str==null){
            return false;
           }
        if(str.length()==0){//长度为0和没有东西还是有区别，注意字符串长度写法，链表，数组长度不用带（）
            return false;
        }
    Stack<Character> stack=new Stack<>();
    for(int i = 0;i < str.length();i++){
        char c = str.charAt(i);
        if(c=='('){
            stack.push(c);
        }else if (c == ')') {
            if (stack.isEmpty()) {return false;}
            else{stack.pop();}
        }
    }
    if(!stack.isEmpty()){
      return false;
    }
    return true;
    }
    public static double parse(String str){
        str = str.replaceAll(" ", "");
        //System.out.println("parse" + str);
        //System.out.println("fuheshuzi"+str.matches("-?\\d+\\.\\d+?"));
        if (str.matches("-?\\d+\\.\\d+?")){
            //System.out.println("helo");
            return Double.parseDouble(str);}
        //count number of test B
        int count = 0;
        int start = 0;
        String s1 = "sin";
        String s2 = "cos";
        String s3 = "tan";
        String s4 = "sqrt";
        String s5 = "(";
        while (str.indexOf(s1, start) >= 0 && start < str.length()){
            count++;
            start = str.indexOf(s1, start) + s1.length();
        }
        while (str.indexOf(s2, start) >= 0 && start < str.length()){
            count++;
            start = str.indexOf(s2, start) + s2.length();
        }while (str.indexOf(s3, start) >= 0 && start < str.length()){
            count++;
            start = str.indexOf(s3, start) + s3.length();
        }while (str.indexOf(s4, start) >= 0 && start < str.length()){
            count++;
            start = str.indexOf(s4, start) + s4.length();
        }
        while (str.indexOf(s5, start) >= 0 && start < str.length()){
            count++;
            start = str.indexOf(s5, start) + s5.length();
        }
        
        //first case: no Test B 括号也算一种testB，只不过前面没有计算，返回式子值本身，不用sin(parse(...))
        if (count == 0) {
        /*int stt = 0;
        int a = str.indexOf(')', stt);
        int b = str.lastIndexOf('(', a);*/
        str = str.replaceAll("\\+", "#+#")
            .replaceAll("-", "#-#")
            .replaceAll("\\*", "#*#")
            .replaceAll("\\/","#/#");
        if (str.startsWith("#")) {str = str.substring(1);}
        String[] split = str.split("#");
        /*for (int i = 0; i < split.length; i++) {
            System.out.println(split[i]);
        }*/
        Double[] nums = new Double[split.length / 2 + 1];
        String[] cals = new String[split.length];
        if (!split[0].equals("-")) {
            //System.out.println("1");
            for (int i = 0; i < split.length; i++) {
                if (i % 2 == 0) {
                   nums[i / 2] = Double.parseDouble(split[i]);}
                else {
                   cals[i / 2] = split[i]; }}
        }
        else{
            nums[0] = 0.0;
            for (int i = 0; i < split.length; i++) {
                if (i % 2 == 0) {
                   cals[i / 2] = split[i];
                } else {
                   nums[i / 2 + 1] = Double.parseDouble(split[i]); }}
        }
        
        /*for (int i = 0; i < split.length / 2 + 1; i++){
            System.out.println(nums[i]);
        }
        for (int i = 0; i < split.length; i++){
            System.out.println(cals[i]);
        }*/

        int in = 0;
        while (in < cals.length) {
            if ((cals[in] != null)&&(cals[in].equals("/"))) {
                int in_2 = in;
                Double pre = nums[in];
                while ((cals[in] != null)&&(cals[in].equals("/"))) {
                    if (nums[in+1] == 0) {return Integer.MIN_VALUE;}
                    pre /= nums[in+1]; 
                    nums[in+1] = 1.0;
                    cals[in] = "*";
                    in++;
                }
                nums[in_2] = pre;
                //System.out.println(nums[in_2]);
                in++;
            }
            else{in++;}
        }   
        for (int i = cals.length - 1; i > -1; i--) {
            if (cals[i] != null) {
                if (cals[i].equals("*")) {
                    nums[i] = nums[i] * nums[i + 1];
                    nums[i + 1] = 1.0;
                }
            }}  
        Double res = nums[0];
        for (int i = 1; i < nums.length; i++) {
                        res = cal1(cals[i - 1], res, nums[i]);
                        //System.out.println(res);
                    }
                    return res;

        }
        else {
            //若存在括号和三角函数
            //构建一个stack存放左括号，当stack不为空或者index未超过str长度时，一直进行寻找括号并替换str的操作
            Stack<Integer> stack=new Stack<>();
            int i = 0;
            String new_str = "0";
            while((i < str.length())||(!stack.empty())){
                //System.out.println(i);
                //System.out.println(str.charAt(i));
                if(str.charAt(i) == '(') {stack.push(i);}
                if (str.charAt(i) == ')') {
                    int pos = stack.pop();
                    if (pos == 0) {
                        String sub = str.substring(pos + 1, i);
                        //System.out.println("substring k_idx" + sub);
                        Double pre_res = parse(sub);
                        String pre_str = String.valueOf(pre_res);
                        StringBuilder sb = new StringBuilder(str);
                        sb.replace(pos, i+1, pre_str);
                        new_str = sb.toString();
                        //System.out.println("new for before ope" + new_str);
                        new_str = oper(new_str);
                        //System.out.println("new for after ope" + new_str);

                    }
                    //如果开头有符号或者在过程中为加减乘除,将括号内的内容替换成算出来的小结果
                    else if ((pos > 0) && ("+-*/".indexOf(str.charAt(pos - 1)) >= 0) ){
                        String sub = str.substring(pos + 1, i);
                        //System.out.println("substring k_idx" + sub);
                        Double pre_res = parse(sub);
                        String pre_str = String.valueOf(pre_res);
                        StringBuilder sb = new StringBuilder(str);
                        sb.replace(pos, i+1, pre_str);
                        new_str = sb.toString();
                        //System.out.println("new for before ope" + new_str);
                        new_str = oper(new_str);
                        //System.out.println("new for after ope" + new_str);

                    }
                    else if ((pos >= 4)&&(str.substring(pos - 4, pos).equals("sqrt"))) {
                        String sub = str.substring(pos + 1, i);
                        //System.out.println("substring k_idx" + sub); 
                        //Double pre_res = 0.0;
                        if (parse(sub) < 0) {return Integer.MIN_VALUE;}
                        else{
                                Double pre_res = Math.sqrt(parse(sub));
                                String pre_str = String.valueOf(pre_res);
                                StringBuilder sb = new StringBuilder(str);
                                sb.replace(pos - 4, i+1, pre_str);
                                new_str = sb.toString();
                                //System.out.println("new for before ope" + new_str);
                                new_str = oper(new_str);
                                //System.out.println("new for after ope" + new_str);
                            }}
                    
                    else if ((pos >= 3) && (str.substring(pos - 3, pos).equals("sin"))) {
                        String sub = str.substring(pos + 1, i);
                        //System.out.println("substring k_idx" + sub);
                        Double pre_res = Math.sin(parse(sub));
                        String pre_str = String.valueOf(pre_res);
                        StringBuilder sb = new StringBuilder(str);
                        sb.replace(pos - 3, i+1, pre_str);
                        new_str = sb.toString();
                        //System.out.println("new for before ope" + new_str);
                        new_str = oper(new_str);
                        //System.out.println("new for after ope" + new_str);

                    }
                    else if ((pos >= 3) && (str.substring(pos - 3, pos).equals("cos"))) {
                        String sub = str.substring(pos + 1, i);
                        //System.out.println("substring k_idx" + sub);
                        Double pre_res = Math.cos(parse(sub));
                        String pre_str = String.valueOf(pre_res);
                        StringBuilder sb = new StringBuilder(str);
                        sb.replace(pos - 3, i+1, pre_str);
                        new_str = sb.toString();
                        //System.out.println("new for before ope" + new_str);
                        new_str = oper(new_str);
                        //System.out.println("new for after ope" + new_str);

                    }
                    else if ((pos >= 3)&&(str.substring(pos - 3, pos).equals("tan"))) {
                        String sub = str.substring(pos + 1, i);
                        //System.out.println("substring k_idx" + sub);
                        Double pre_res = Math.tan(parse(sub));
                        String pre_str = String.valueOf(pre_res);
                        StringBuilder sb = new StringBuilder(str);
                        sb.replace(pos - 3, i+1, pre_str);
                        new_str = sb.toString();
                        //System.out.println("new for before ope" + new_str);
                        new_str = oper(new_str);
                        //System.out.println("new for after ope" + new_str);
                    }
                    //catch (Exception e){System.out.println("Invalid");}
                }
                i++;
            }
            if (new_str != "0") {
                //System.out.println("new formula k_idx" + new_str);
                return parse(new_str);
            } 
            return Integer.MIN_VALUE;
        }/*}*/
        //return 0;
        //如何终止程序？？
    }
    public static Double cal1(String index, Double pre, Double curr) {
        switch (index) {
            case "+":
                return pre + curr;
            case "-":
                return pre - curr;
            case "*":
                return pre * curr;
            case "/":
                return pre/curr;
        }
        return pre + curr;
    }
    public static Integer fin(String str, int idx) {
      for (int i = idx; i >= 0; i--) {
        if ("+-".indexOf(str.charAt(i)) >= 0){return i;}
      }
      return 0;
    }
    public static String oper(String str){
        if(str.contains("*-")){
          int idx= str.indexOf("*-"); 
          int b= fin(str, idx); 
          if(b==0){
             str="-"+str.substring(0, idx)+"*"+str.substring(idx+2);}
          else{
            if(str.charAt(b)=='+'){
              str=str.substring(0,b)+"-"+str.substring(b+1,idx)+"*"+str.substring(idx+2);}
            else{
              str=str.substring(0,b)+"+"+str.substring(b+1,idx)+"*"+str.substring(idx+2);
            }}}
        if(str.contains("/-")){
          int idx = str.indexOf("/-"); 
          int b=fin(str, idx); 
          if(b==0){
           str="-"+str.substring(0,idx)+"/"+str.substring(idx+2);}
          else{
           if(str.charAt(b)=='+'){
             str=str.substring(0,b)+"-"+str.substring(b+1,idx)+"/"+str.substring(idx+2);}
           else{
             str=str.substring(0,b)+"+"+str.substring(b+1,idx)+"/"+str.substring(idx+2);
           }
        }}
        if(str.contains("+-")){
           int idx=str.indexOf("+-");
           str=str.substring(0,idx)+"-"+str.substring(idx+2);}
        if(str.contains("--")){
            int idx = str.indexOf("--");
            if (idx == 0) {str = str.substring(idx+2);}
            else{str = str.substring(0, idx) + "+" + str.substring(idx+2);}}
        return str;}
    public static void main(String[] args) throws Exception{
       Scanner input = new Scanner(System.in);
       while(input.hasNextLine()){
        String str = input.nextLine();
        Boolean flag = estimate(str);
        if(flag){
            //System.out.println("hello!");
            double result = parse(str);
            if (result != Integer.MIN_VALUE){
            System.out.println(String.valueOf(Math.round(result)));
            }
            else{
                System.out.println("invalid");
                continue;}
        }
        else{
            System.out.println("invalid");
        }
    }
}
}
