def emirps_100():
    '''
    Displays the first 100 emirps. Display 10 numbers per line and align the numbers properly.
    This function does not need a return value.
    '''
    ########### Start your code ############
    ### hint: When aligh the numbers, monospaced font will be helpful.
    def judge_prime(n):
        for i in range(2, n):
            if n % i == 0:
                return False
        else:
            return True

    def emirp(n):
        number = int(str(n)[::-1])
        return number

    n = 2
    the_count = 0
    while the_count < 100:
        number = emirp(n)
        if judge_prime(n) == True and judge_prime(number) == True and n != number:
            print('%4d' % n, end=" ")
            the_count += 1
            if the_count % 10 == 0:
                print()
        n += 1
    ############ End your code #############

if __name__ == '__main__':
    emirps_100()

    # You can just print your solution. Like this:
    #    13   17   31   37   71   73   79   97  107  113
    #   149  157  167  179  199  311  337  347  359  389
    # ...




