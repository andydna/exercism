def is_pangram(sentence):
    alphabet = list('abcdefghijklmnopqrstuvwxyz')
    for letter in alphabet:
        if sentence.lower().count(letter) < 1:
            return False
    return True
