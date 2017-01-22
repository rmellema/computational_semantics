#!/usr/bin/env python3
from nltk.corpus import wordnet as wn
import sys

def is_plural(word, synset):
    return word not in synset.lemma_names()

def main(max_forms = None):
    noun_template = "n0({pl}, {det}, lam(X, {pred})) --> {words}."
    adj_template  = "a0({det}, lam(P, {pred})) --> {words}."
    for line in sys.stdin:
        line = line.strip().split(' ')
        word = '_'.join(line)
        synsets = wn.synsets(word, pos = [wn.NOUN, wn.ADJ])
        num = max_forms if max_forms else len(synsets)
        for synset in synsets[:num]:
            lemma, pos, num = synset.name().split('.')
            plural = is_plural(word, synset)
            if pos == 'n':
                template = noun_template
            else:
                template = adj_template
            pred = "{}_{}_{}".format(pos, lemma, num.lstrip('0'))
            print(template.format(
                pl = "pl" if plural else "sg",
                det = "_" if plural else "a",
                pred = pred,
                words = '[' + ', '.join(line) + ']'))


if __name__ == '__main__':
    num = None
    if len(sys.argv) > 1:
        num = int(sys.argv[1])
    main(num)
