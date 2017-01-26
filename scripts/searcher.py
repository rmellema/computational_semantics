import argparse
import os.path 
from nltk import pos_tag, word_tokenize
from nltk.corpus import words
from nltk.metrics import edit_distance
import shlex
from subprocess import run, PIPE
import sys

def spell_check(word):
    best_match = []
    best_score = 100
    for suggestion in words.words():
        score = edit_distance(word, suggestion, transpositions = True)
        if score < best_score:
            best_match = [suggestion]
            best_score = score
        elif score == best_score:
            best_match.append(suggestion)
    return best_match

def is_correct(word):
    return word in words.words()

def correct_sentence(sent):
    tagged = pos_tag(sent)
    ret = []
    for word, tag in tagged:
        if not is_correct(word):
            suggestions = pos_tag(spell_check(word))
            for suggestion, stag in suggestions:
                if tag == stag:
                    ret.append(suggestion)
                    break
            else:
                ret.append(suggestions[0][0])
        else:
            ret.append(word)
    return ret

def to_latex(printer, paths):
    printer(r"\documentclass{article}")
    printer(r"\usepackage{graphicx}")
    printer(r"\begin{document}")
    for path in paths:
        printer("\\includegraphics[width=120pt,height=90pt]{{{}}}".format(path))
    printer(r"\end{document}")

def main(options):
    line = input("> ")
    correct_line = correct_sentence(word_tokenize(line.lower()))
    grim_search = os.path.join(options.grim, "prolog", "search.pl")
    result = run(
            ['swipl', '-g', "[\'{}\'], main({}), halt." \
                    .format(grim_search, options.number)],
            input  = str(correct_line) + '.', encoding = 'utf-8',
            stdout = PIPE)
    if options.latex:
        paths = result.stdout.strip().split('\n')
        if options.latex == '-':
            to_latex(print, paths)
        else:
            out_file = options.latex
            with open(out_file, 'w') as f:
                def writer(line):
                    f.write(line)
                    f.write('\n')
                to_latex(writer, paths)
    if options.display:
        paths = result.stdout.strip().split('\n')
        command = shlex.split(options.display)
        for path in paths:
            c = command[:]
            c.append(path)
            run(c)
    else:
        print(result.stdout.strip())

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("-n", "--number", 
        help = "The maximum number of images to return for a query",
        default = 5)
    parser.add_argument("-g", "--grim",
            help = "The location for the grim data set",
            default = ".")
    parser.add_argument("-l", "--latex",
            help = "Write the output to a latex file. If '-' or no file is" 
                   "given, stdout is used for output",
            nargs = '?',
            const = '-')
    parser.add_argument("-d", "--display",
            help = "A command used to display the found images. The command" 
                   "is called for each image and appended to the end of the"
                   "command. If given with the --latex command, the latex "
                   "file will be written before these commands are run")
    main(parser.parse_args())
