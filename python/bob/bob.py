def hey(phrase):
    # i miss ruby
    phrase = phrase.strip()
    if len(phrase) == 0:
        return "Fine. Be that way!"
    elif phrase[-1] == '?':
        phrase = phrase[:-1]
        if phrase.isdigit():
            return "Sure."
        if phrase == phrase.upper():
            if phrase == phrase.lower():
                return "Sure."
            else:
                return "Calm down, I know what I'm doing!"
        else:
            return "Sure."
    
    if phrase == phrase.upper():
        if phrase == phrase.lower():
            return "Whatever."
        else:
            return "Whoa, chill out!"
    else:
        return "Whatever."
