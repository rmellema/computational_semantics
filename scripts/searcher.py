import argparse
import enchant
import os.path 
from nltk import pos_tag, word_tokenize
import shlex
from subprocess import run, PIPE, STDOUT
import sys
#import spacy

#nlp = spacy.load('en')
checker = enchant.Dict("en_US")

def correct_sentence(sent):
    tagged = pos_tag(sent)
    ret = []
    for word, tag in tagged:
        if not checker.check(word):
            suggestions = pos_tag(checker.suggest(word))
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

def output_results(options, sentence, formula, paths):
    if formula == '' or formula == '% halt':
        sys.stderr.write("No results found.\n")
        return
    if options.latex:
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
        print(formula)
        command = shlex.split(options.display)
        for path in paths:
            c = command[:]
            c.append(path)
            run(c)
    else:
        print(formula)
        for path in paths:
            print(path)

def main_loop(options, grim_search, command):
    try:
        while True:
            single_run(options, grim_search, command)
    except EOFError:
        print()

def single_run(options, grim_search, command):
    line = input("> ")
    correct_line = correct_sentence(word_tokenize(line.lower()))
    result = run(command,
            input  = str(correct_line) + '.', encoding = 'utf-8',
            stdout = PIPE, stderr = sys.stderr)
    res = result.stdout.strip().split('\n')
    output_results(options, line.strip(), res[0], res[1:])

def main(options):
    grim_search = os.path.join(options.grim, "prolog", "search.pl")
    command = ['swipl', '-g', "[\'{}\'], main({}), halt." \
                        .format(grim_search, options.number)]
    if options.interactive:
        main_loop(options, grim_search, command)
    else:
        single_run(options, grim_search, command)

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
                   "given, stdout is used for output. If multiple queries are"
                   "given in a row, the file gets overwritten after each query.",
            nargs = '?',
            const = '-')
    parser.add_argument("-i", "--interactive",
            action = "store_true",
            help = "Process multiple queries in a row")
    parser.add_argument("-d", "--display",
            help = "A command used to display the found images. The command" 
                   "is called for each image and appended to the end of the"
                   "command. If given with the --latex command, the latex "
                   "file will be written before these commands are run")
    main(parser.parse_args())
