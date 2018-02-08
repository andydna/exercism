def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError('whoops')
    distance = 0
    for nuke_a, nuke_b in zip(strand_a, strand_b):
        if nuke_a != nuke_b:
            distance += 1
    return distance
