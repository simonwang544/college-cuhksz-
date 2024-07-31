import java.util.Scanner;

public class WordSearching {
    //在这个作业我们用到深度搜索
    private static int[] dx = {-1, 1, 0, 0};//定义了一个静态整型数组dx，用于在DFS中表示行的移动（向上和向下）。
    private static int[] dy = {0, 0, -1, 1};//定义了一个静态整型数组dy，用于在DFS中表示列的移动（向左和向右）。
    private static char[][] board;          //声明一个字符型二维数组
    private static boolean[][] visited;     //布尔型二维数组，用于后续标记是否被踩过
    private static int m, n;                //网格的行和列

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        //先拿到输入的网格框架
        m = scanner.nextInt();
        n = scanner.nextInt();
        scanner.nextLine(); //移动光标到下一行
        //创建网格，并开始填入数据
        board = new char[m][n];
        for (int i = 0; i < m; i++) {
            String[] line = scanner.nextLine().split(" ");
            for (int j = 0; j < n; j++) {
                board[i][j] = line[j].charAt(0);
            }
        }
        //继续读取单词行
        int T = scanner.nextInt();
        scanner.nextLine(); //移动光标到下一行
        //存储要查询单词每一行
        for (int i = 0; i < T; i++) {
            String word = scanner.nextLine();
            System.out.println(exists(word) ? "true" : "false");//调用“exists”函数，判断是否存在，存在就“true”
        }

        scanner.close();
    }
    //exists函数
    private static boolean exists(String word) {
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (board[i][j] == word.charAt(0)) {
                    visited = new boolean[m][n];
                    if (dfs(i, j, 0, word)) { //调用dfs搜索函数，判断是否能搜索到
                        return true;
                    }
                }
            }
        }
        return false;
    }
    //dfs函数
    private static boolean dfs(int x, int y, int index, String word) {
        if (index == word.length()) {
            return true;  //当递归到查询单词最后一个字母的时候就可以完成查询
        }
        if (x < 0 || y < 0 || x >= m || y >= n || visited[x][y] || board[x][y] != word.charAt(index)) {
            return false;//当搜索超出网格范围或x或y为负数时或查找的位置已经查找过时或查找的单词不存在时就停止，并返回
        }
        //先标记现在位置
        visited[x][y] = true;
        for (int i = 0; i < 4; i++) {
            if (dfs(x + dx[i], y + dy[i], index + 1, word)) {
                return true;
            }
        }
        visited[x][y] = false; // 注意，要回溯，取消标记，这样才能不影响下一次标记。并返回false
        return false;
    }
}