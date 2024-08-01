def eight_queens():

    """
    The classic Eight Queens puzzle is to place eight queens on a 
    chessboard such that no two queens can attack each other (i.e., no two queens are in the 
    same row, same column, or same diagonal). There are many possible solutions. Write a 
    program that displays one such solution.

    Note: you cannot just pre-define a solution and display it. 
    Please use algorithm to display a possible solution.
    """

    ############## Start your codes ##############
    def judge_queen(n):
        for i in range(0, n):
            if row[i] == row[n]:
                return 0
            if abs(row[n] - row[i])==n - i  :
                return 0
        else:
            return 1

    def queen(n):
        if n == 8:
            return 1
        for i in range(0, 8):
            row[n] = i
            if judge_queen(n)==1:
                if queen(n + 1) ==1:
                   return 1
        else:
            return 0

    def output():
        queen(0)
        for i in row:
            print('| ' * i, end='')

            print('|', 'Q', sep='', end='')

            print('| ' * (8 - i))

    row = [0] * 8
    output()



    ##############  End your codes  ##############


if __name__ == '__main__':
    eight_queens()

    # This function does not need a return value. 
    # You can just print your solution. For example:
    # |Q| | | | | | | |
    # | | | | |Q| | | |
    # | | | | | | | |Q|
    # | | | | | |Q| | |
    # | | |Q| | | | | |
    # | | | | | | |Q| |
    # | |Q| | | | | | |
    # | | | |Q| | | | |