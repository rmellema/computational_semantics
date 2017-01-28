#!/usr/bin/env python3
from collections import defaultdict
import itertools
from nltk.corpus import wordnet as wn
from numpy import dot
from numpy.linalg import norm
import spacy
import sys

nlp = spacy.load('en')

def cosine(v1, v2):
    z = dot(v1, v2) / (norm(v1) * norm(v2))
    return z

def similar(w1, n):
    w1 = nlp.vocab[w1]
    vocabulary = [w for w in nlp.vocab if w.has_vector and w.orth_.islower() and w.lower_ != w1]
    vocabulary.sort(key=lambda w: cosine(w.vector, w1.vector))
    vocabulary.reverse()
    ws = [w.orth_ for w in vocabulary[:n]]
    return ws

def is_plural(word, synset):
    return word not in synset.lemma_names()

def is_vowel(letter):
    return letter in 'aeiou'

def process_word(nouns, adjectives, line, max_forms):
    word = '_'.join(line)
    synsets =  wn.synsets(word, pos = wn.ADJ)[:max_forms]
    synsets += wn.synsets(word, pos = wn.NOUN)[:max_forms]
    det = 'an' if is_vowel(word[0]) else 'a'
    for synset in synsets:
        lemma, pos, num = synset.name() \
            .replace("'", "") \
            .replace("-", "_") \
            .split('.')
        plural = is_plural(word, synset)
        pred = "{}_{}_{}(X)".format(pos, lemma, num.lstrip('0'))
        pl = "pl" if plural else "sg"
        det = "_" if plural else det
        if pos == 'n':
            nouns[(pl, det, pred)].add(' '.join(line))
        else:
            pred = "lam(X, and({}, app(P, X)))".format(pred)
            adjectives[(det, pred)].add(' '.join(line))

def print_clause(head, wordset):
    print(head, end = '')
    print(" --> ", end = '')
    print("; ".join('[' + ', '.join(word.split(' ')) + ']' for word in wordset), end = '')
    print('.')

def main(max_forms = None):
    nouns      = defaultdict(lambda: set())
    adjectives = defaultdict(lambda: set())
    processed = set()
    vowels = 'aeiou'
    noun_template = "n0({pl}, {det}, lam(X, {pred}))"
    adj_template  = "a0({det}, lam(P, {pred}))"
    for line in sys.stdin:
        line = line.strip()
        sys.stderr.write(line)
        sys.stderr.write('\n')
        if line == '':
            continue
        if ' ' not in line:
            words = [[line]]
            words.extend([w] for w in similar(line, 5))
        else:
            words = [line.split(' ')]
            words.extend(itertools.product((word for word in words[0]), 5))
        for word in words:
            if ' '.join(word) not in processed:
                process_word(nouns, adjectives, word, max_forms)
                processed.add(' '.join(word))
    for key, wordlist in adjectives.items():
        det, pred = key
        head = adj_template.format(det = det, pred = pred)
        print_clause(head, wordlist)
    for key, wordlist in nouns.items():
        pl, det, pred = key
        head = noun_template.format(pl = pl, det = det, pred = pred)
        print_clause(head, wordlist)

if __name__ == '__main__':
    num = None
    if len(sys.argv) > 1:
        num = int(sys.argv[1])
    main(num)
