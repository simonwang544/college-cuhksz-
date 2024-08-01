import java.util.*;
public class wzwpuzzle {
    public static class State {
        int[][] board; 
        int moves;
        int manhattan;
        int priority;
        State pre;

        public State(int[][] b, int move, State father) {
            this.pre = father;
            this.moves = move;
            this.board = b;
            int man = 0;
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    if (b[i][j] != 0) {
                        man += Math.abs((b[i][j] - 1)%3 - j) + Math.abs((b[i][j]-1)/3 - i);
                    }
                }
            }
            this.manhattan = man;
            this.priority = man + move;
        }
        public void display() {
            System.out.println("");
            int[][] b= this.board;
            for (int i =0; i < 3; i++) {
                System.out.println(b[i][0]+" "+ b[i][1]+" "+ b[i][2]);
            }
        }
        public boolean equal(int[][] b) {
            boolean t = true;
            for (int i =0; i < 3; i++) {
                for (int j = 0 ; j < 3; j++) {
                    if (this.board[i][j] != b[i][j]) {t = false;}
                }
            }
            return t;
        }
        public int[][] exchange(int i1, int j1, int i2, int j2) {
            int[][] newboard = new int[3][3];
            for (int i =0; i < 3; i++) {
                for (int j = 0 ; j < 3; j++) {
                    newboard[i][j] = this.board[i][j];
                } 
            }
            int temp = newboard[i1][j1];
            newboard[i1][j1] = newboard[i2][j2];
            newboard[i2][j2] = temp;
            return newboard;
        }
    
        public Iterable<State> neighbors() {
            ArrayList<State> neighborStates = new ArrayList<State>();
            int[][] newboard;
            for (int i =0; i < 3; i++) {
                for (int j = 0 ; j < 3; j++) {
                    if (this.board[i][j] == 0) {
                        if (i > 0) {
                            newboard = exchange(i, j, i-1, j);
                            State neighbor = new State(newboard, this.moves + 1, this);
                            neighborStates.add(neighbor);
                        }
                        if (i < 2) {
                            newboard = exchange(i, j, i+1, j);
                            State neighbor = new State(newboard, this.moves + 1, this);
                            neighborStates.add(neighbor);
                        }
                        if (j > 0) {
                            newboard = exchange(i, j, i, j-1);
                            State neighbor = new State(newboard, this.moves + 1, this);
                            neighborStates.add(neighbor);
                        }
                        if (j < 2) {
                            newboard = exchange(i, j, i, j+1);
                            State neighbor = new State(newboard, this.moves + 1, this);
                            neighborStates.add(neighbor);
                        }
                        break;
                    }
                }
            }
            return neighborStates;
        }
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int[][] initial = new int[3][3];
        String str = input.nextLine()+input.nextLine()+input.nextLine();
        str = str.replaceAll(" ", "");
        char[] array = str.toCharArray();
        int x = 0;
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                initial[i][j] = Character.getNumericValue(array[x]);
                x += 1;
            }
        }
        State start = new State(initial,0,null);
        PriorityQueue<State> queue = new PriorityQueue<State>(
            (s1,s2)->Integer.compare(s1.priority,s2.priority)
        );
        Stack<State> display = new Stack<State>();
        queue.add(start);
        State current = queue.poll();
        while(current.manhattan != 0) {
            for (State s : current.neighbors()) {
                if (current.pre == null || !s.equal(current.pre.board)) {
                    queue.add(s);
                }
            }
            current = queue.poll();
        }
        System.out.println(current.moves);
        while (current.pre != null) {
            display.add(current);
            current = current.pre;
        }
        current.display();
        while (!display.empty()) {
            display.pop().display();
        }

    }
    
}
