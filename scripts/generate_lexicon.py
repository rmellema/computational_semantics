#!/usr/bin/env python3
from nltk.corpus import wordnet as wn
import sys

def is_plural(word, synset):
    return word not in synset.lemma_names()

def main(max_forms = None):
    vowels = 'aeiou'
    noun_template = "n0({pl}, {det}, lam(X, {pred})) --> {words}."
    adj_template  = "a0({det}, lam(P, {pred})) --> {words}."
    for line in sys.stdin:
        line = line.strip().split(' ')
        word = '_'.join(line)
        synsets =  wn.synsets(word, pos = wn.ADJ)[:max_forms]
        synsets += wn.synsets(word, pos = wn.NOUN)[:max_forms]
        for synset in synsets:
            lemma, pos, num = synset.name() \
                .replace("'", "") \
                .replace("-", "_") \
                .split('.')
            plural = is_plural(word, synset)
            pred = "{}_{}_{}(X)".format(pos, lemma, num.lstrip('0'))
            if pos == 'n':
                template = noun_template
            else:
                template = adj_template
                pred = "lam(X, and({}, app(P, X)))".format(pred)
            det = 'an' if word[0] in vowels else 'a'
            print(template.format(
                pl = "pl" if plural else "sg",
                det = "_" if plural else det,
                pred = pred,
                words = '[' + ', '.join(line) + ']'))


if __name__ == '__main__':
    num = None
    if len(sys.argv) > 1:
        num = int(sys.argv[1])
    main(num)
