import re

def word_count(string):
    string = re.sub('[_]', ' ', string)
    string = re.sub('[,]', ' ', string)
    string = re.sub('[\s]', ' ', string)
    string = re.sub("n't", 'nZt', string)
    string = re.sub("'", ' ', string)
    string = re.sub('"', ' ', string)
    string = re.sub('[\W]', ' ', string)
    string = re.sub('nZt',"n't", string)
    string = string.lower()
    dictionary = {}
    split = string.split()
    for word in split:
        dictionary[word] = split.count(word)
    return dictionary
