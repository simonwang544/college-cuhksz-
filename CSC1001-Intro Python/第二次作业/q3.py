def isValid(number):
    ''' Return True if the card number is valid.
    param number: The card number.
    return: True of False
    '''
    ########### Start your code ############
    if len(str(number)) < 13 or len(str(number)) > 16:
        print('The card number is invalid!')
        return False
    if str(number)[0] != '4' and str(number)[0] != '5' and str(number)[0] != '37' and str(number)[0] != '6':
        print('The card number is invalid!')
        return False
    all_numbers = int(str(number)[::-1])
    a = sumOfDoubleEvenPlace(all_numbers)
    b = sumOfOddPlace(all_numbers)
    really_sum = a + b
    if really_sum % 10 == 0:
        print('The credit card number is valid.')
    else:
        print('The card number is invalid!')
    return True

    ############ End your code #############

def sumOfDoubleEvenPlace(number):
    ''' Get the result from step 2.
    param number: The card number.
    return: Sum of double even place.
    '''
    ########### Start your code ############
    list_1 = str(number)[-2::-2]
    count = 0
    sum = 0
    while count < len(list_1):
        sum = sum + int(getDigit(count))
        count += 1
    return sum

    ############ End your code #############

def getDigit(number):
    ''' Get digit of the number. For instance: getDigit(5) = 5, getDigit(15) = 6.
    param number: A number who only has one or two digits.
    return: Return this number if it is a single digit, otherwise return the sum of the two digits.
    '''
    ########### Start your code ############
    double_n = int(str(number)[0]) * 2
    if double_n >= 10:
        double_n = int(str(double_n)[0]) + int(str(double_n)[1])
        return double_n
    return double_n

    ############ End your code #############

def sumOfOddPlace(number):
    ''' Return the sum of odd place digits in number.
    param number: The card number.
    return: The sum of odd place digits.
    '''
    ########### Start your code ############
    list_2 = str(number)[::-2]
    count = 0
    sum = 0
    while count < len(list_2):
        sum = sum + int(list_2[count])
        count += 1
    return sum

    ############ End your code #############


if __name__ == '__main__':
    # Example test cases
    # Note: there will be more test cases in scoring
    ans1 = isValid(4388576018402626)
    ans2 = isValid(4388576018410707)
    ######## We will judge the correctness by examing the result of isValid() function. #########