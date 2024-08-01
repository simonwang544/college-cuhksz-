def isAnagram(s1, s2):
    """
    Write a function that checks whether two words are anagrams.
    Two words are anagrams if they contain the same letters.
    You can write a program to change the 'result' to Ture or False
    For example, silent and listen are anagrams, and the result = True.
    """

    # initialize result
    result = True

    ############## Start your codes ##############
    s1 = sorted(list(s1))
    s2 = sorted(list(s2))
    if s1 == s2:
        result = ("is an anagram")
    else:
        result = ("is not an anagram")
    ##############  End your codes  ##############

    return result


if __name__ == '__main__':

    # Example test cases
    # Note: there will be more test cases in scoring
    s1 = ["listen", "car", "anagram", "a", "ttttttta"]
    s2 = ["slient", "rat", "nagaram", "an", "tatttttt"]

    for i in range(5):
        print(isAnagram(s1[i], s2[i]))

    # The display of output will be:
    # True
    # False
    # True
    # False
    # True