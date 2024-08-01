import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Scanner;
@SuppressWarnings("rawtypes")
public class Puzzle8 implements Comparable{
    private int[] num = new int[9];
    private int evaluation;                //估计函数f(n)：从起始状态到目标的最小估计值
    private int depth;                    //d(n)：当前的深度，即走到当前状态的步骤
    private int misposition;            //启发函数 h(n)：到目标的最小估计(记录和目标状态有多少个数不同)
    private Puzzle8 parent;            //当前状态的父状态
    private ArrayList<Puzzle8> answer = new ArrayList<Puzzle8>();    //保存最终路径

    /**下边几个get 和 set 函数
     *  因为private参数只有在本类内才能调用，（这个也叫做封装，把变量只存在本类中，
     *  其他想调用可以通过函数实现，但是外面并不知道这个类里面有什么成员变量，只能看到函数）
     *  但是就一个类，其实也没必要写get函数
     */
    public int[] getNum() {
        return num;
    }
    public void setNum(int[] num) {
        this.num = num;
    }
    public int getDepth() {
        return depth;
    }
    public void setDepth(int depth) {
        this.depth = depth;
    }
    public int getEvaluation() {
        return evaluation;
    }
    public void setEvaluation(int evaluation) {
        this.evaluation = evaluation;
    }
    public int getMisposition() {
        return misposition;
    }
    public void setMisposition(int misposition) {
        this.misposition = misposition;
    }
    public Puzzle8 getParent() {
        return parent;
    }
    public void setParent(Puzzle8 parent) {
        this.parent = parent;
    }

    /**
     * 判断当前状态是否为目标状态
     * @param target
     * @return
     */
    public boolean isTarget(Puzzle8 target){
        return Arrays.equals(getNum(), target.getNum());
    }

    /**
     * 求估计函数f(n) = g(n)+h(n);
     * 初始化状态信息
     * @param target
     */
    public void init(Puzzle8 target){
        int temp = 0;
        for(int i=0;i<9;i++){
            if(num[i]!=target.getNum()[i])
                temp++;            //记录当前节点与目标节点差异的度量
        }
        this.setMisposition(temp);
        if(this.getParent()==null){
            this.setDepth(0);    //初始化步数（深度）
        }else{
            this.depth = this.parent.getDepth()+1;//记录步数
        }
        this.setEvaluation(this.getDepth()+this.getMisposition());//返回当前状态的估计值
    }

    /**
     * 求逆序值并判断是否有解，逆序值同奇或者同偶才有解
     * @param target
     * @return 有解：true 无解：false
     */
    /**
     * 对每个子状态的f(n)进行由小到大排序
     * */
    @Override
    public int compareTo(Object o) {
        Puzzle8 c = (Puzzle8) o;
        return this.evaluation-c.getEvaluation();//默认排序为f(n)由小到大排序
    }
    /**
     * @return 返回0在八数码中的位置
     */
    public int getZeroPosition(){

        for(int i=0;i<9;i++){
            if(this.num[i] == 0){
                return i;
            }
        }
        return -1;//没找到0（虽然一定会找到，但是这样写安全一些，一旦有-1，那就是出问题了）

    }
    /**
     * 去重，当前状态不重复返回-1
     * @param open    状态集合
     * @return 判断当前状态是否存在于open表中
     */
    public int isContains(ArrayList<Puzzle8> open){
        for(int i=0; i<open.size(); i++){
            //当前状态是否存在于open表中，返回open表的位置
            if(Arrays.equals(open.get(i).getNum(), getNum())){
                return i;
            }
        }
        return -1;
    }
    /**
     * 一维数组
     * @return 小于（一维数组的第）3（也就是二维数组的第一行）的不能上移返回false
     * 也就是空格在第一行，空格肯定不能往上边走
     */
    public boolean isMoveUp() {
        int position = getZeroPosition();
        return position > 2;
    }
    /**
     *
     * @return 大于（一维数组的第）6位（也就是二维数组的第三行）不能下移返回false
     * 也就是空格在第三行，空格肯定不能往下边走
     */
    public boolean isMoveDown() {
        int position = getZeroPosition();
        return position < 6;
    }
    /**
     *
     * @return 空格在一维数组的第0，3，6位（也就是二维数组的第一列）不能左移返回false
     */
    public boolean isMoveLeft() {
        int position = getZeroPosition();
       /* if(position%3 == 0){
            return false;
        }
        return true;*/
        return position % 3 != 0;
    }
    /**
     *
     * @return 空格在一维数组的第2，5，8位（也就是二维数组第三列）不能右移返回false
     */
    public boolean isMoveRight() {
        int position = getZeroPosition();
       /* if((position)%3 == 2){
            return false;
        }
        return true;*/
        return (position) % 3 != 2;
    }
    /**
     *
     * @param move 0：上，1：下，2：左，3：右
     * @return 返回移动后的状态
     */
    public Puzzle8 moveUp(int move){
        Puzzle8 temp = new Puzzle8();
        int[] tempnum = num.clone();
        temp.setNum(tempnum);

        int position = getZeroPosition();    //0的位置
        int p=0;                            //与0换位置的位置
        switch(move){
            case 0:
                p = position-3;
                temp.getNum()[position] = num[p];
                break;
            case 1:
                p = position+3;
                temp.getNum()[position] = num[p];
                break;
            case 2:
                p = position-1;
                temp.getNum()[position] = num[p];
                break;
            case 3:
                p = position+1;
                temp.getNum()[position] = num[p];
                break;
        }
        temp.getNum()[p] = 0;
        return temp;
    }
    /**
     * 一维数组按照3*3格式输出
     */
    public void print(){
        for(int i=0;i<9;i++){
            if(i%3 == 2){
                System.out.println(this.num[i]);
            }else{
                System.out.print(this.num[i]+"  ");
            }
        }
    }
    /**
     * 将最终答案路径保存下来并输出
     */
    public void printRoute(){
        Puzzle8 temp = null;
        int count = 0;
        temp = this;
        //计算最小移动步数
        while(temp != null){
            answer.add(temp);
            temp = temp.getParent();
            count++;
        }
        //输出最小移动步数
        System.out.println(count-1);
        //输出空格
        System.out.println();
        System.out.println();
        for(int i = answer.size()-1 ; i>=0 ; i--){
            answer.get(i).print();
            //步骤与步骤之间的空行
            if (i != 0)
                System.out.println();
        }
    }
    /**
     *
     * @param open open表
     * @param close close表
     * @param parent 父状态
     * @param target 目标状态
     */
    public void operation(ArrayList<Puzzle8> open,ArrayList<Puzzle8> close,Puzzle8 parent,Puzzle8 target){
        if(this.isContains(close) == -1){//如果不在close表中
            int position = this.isContains(open);//获取在open表中的位置
            if(position == -1){//如果也不在open表中
                this.parent = parent;//指明它的父状态
                this.init(target);//计算它的估计值
                open.add(this);//把它添加进open表
            }else{//如果它在open表中
                if(this.getDepth() < open.get(position).getDepth()){//跟已存在的状态作比较，如果它的步数较少则是较优解
                    open.remove(position);//把已经存在的相同状态替换掉
                    this.parent = parent;
                    this.init(target);
                    open.add(this);
                }
            }
        }
    }

    @SuppressWarnings("unchecked")
    public static void main(String args[]){
        //定义open表
        ArrayList<Puzzle8> open = new ArrayList<Puzzle8>();
        ArrayList<Puzzle8> close = new ArrayList<Puzzle8>();
        Puzzle8 start = new Puzzle8();
        Puzzle8 target = new Puzzle8();

        Scanner s = new Scanner(System.in);
        int stnum[] = new int[9];
        int tanum[] = {1, 2, 3, 4, 5, 6, 7, 8, 0};
        //输入初始状态
        for(int i = 0; i< 9; i++){
            stnum[i] = s.nextInt();
        }
        //避免出问题，内存泄漏等
        s.close();
        //设置初始状态和最终状态
        start.setNum(stnum);
        target.setNum(tanum);
        //初始化初始状态
        start.init(target);
        open.add(start);
        //进行操作
        while(open.isEmpty() == false){
            Collections.sort(open);            //按照evaluation的值排序
            Puzzle8 best = open.get(0);    //从open表中取出最小估值的状态并移出open表
            open.remove(0);
            close.add(best);

            if(best.isTarget(target)){
                //输出
                best.printRoute();
                System.exit(0);
            }

            int move;
            //由best状态进行扩展并加入到open表中
            //0的位置上移之后状态不在close和open中设定best为其父状态，并初始化f(n)估值函数
            if(best.isMoveUp()){//可以上移的话
                move = 0;//上移标记
                Puzzle8 up = best.moveUp(move);//best的一个子状态
                up.operation(open, close, best, target);
            }
            //0的位置下移之后状态不在close和open中设定best为其父状态，并初始化f(n)估值函数
            if(best.isMoveDown()){
                move = 1;
                Puzzle8 down = best.moveUp(move);
                down.operation(open, close, best, target);
            }
            //0的位置左移之后状态不在close和open中设定best为其父状态，并初始化f(n)估值函数
            if(best.isMoveLeft()){
                move = 2;
                Puzzle8 left = best.moveUp(move);
                left.operation(open, close, best, target);
            }
            //0的位置右移之后状态不在close和open中设定best为其父状态，并初始化f(n)估值函数
            if(best.isMoveRight()){
                move = 3;
                Puzzle8 right = best.moveUp(move);
                right.operation(open, close, best, target);
            }

            }
        }
}