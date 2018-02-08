def to_rna(dna_strand):
    # dna: A C G T
    # rna: U G C A
    # first A to U, then T to A, then G to X, C to G, X to C
    if dna_strand.count('U') > 0:
        raise ValueError('dotplus')
    if dna_strand.count('X') > 0:
        raise ValueError('dotplus')
    return dna_strand.replace('A','U').replace('T','A').replace('G','X').replace('C','G').replace('X','C')


