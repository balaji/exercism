def is_pangram(string):
    return not set("abcdefghijklmnopqrstuvwxyz") - set(string.lower())