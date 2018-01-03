options = {'C' : 'G', 'G' : 'C', 'A' : 'U', 'T' : 'A'}

def to_rna(str):
    return ''.join(options[w] for w in str)