def is_isogram(string):
    chars = list(string.lower().replace(' ','').replace('-',''))
    for char in chars:
        if chars.count(char) > 1:
            return False
    return True
