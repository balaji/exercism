def distance(s1, s2):
    count = 0
    for w1, w2 in zip(s1, s2):
        if w1 != w2:
            count += 1
    return count