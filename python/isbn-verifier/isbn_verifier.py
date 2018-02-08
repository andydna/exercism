def verify(isbn):
    isbn = isbn.replace('-','')
    if len(isbn) != 10:
        return False
    if isbn.count('A') > 0:
        return False
    if isbn.count('K') > 0:
        return False
    if isbn[:-1].count('X') > 0:
        return False
    to_list = list(isbn)
    if to_list[9] == 'X':
       to_list[9] = 10
    ints = list(map(int, to_list))
    ints = [11] + ints
    if (ints[1]*10+ints[2]*9+ints[3]*8+ints[4]*7+ints[5]*6+ints[6]*5+ints[7]*4+ints[8]*3+ints[9]*2+ints[10]*1) % 11 == 0:
        return True
    else:
        return False

