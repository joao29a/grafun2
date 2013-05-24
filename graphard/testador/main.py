# encoding: utf-8

import sys
import os
import codecs
from progunitutils import *
from eccheck import eulerian_cycle_check_main
from tspcheck import tsp_check_main

sys.stdout = codecs.getwriter('utf-8')(sys.stdout)

CHECKERS = {
    'ec': eulerian_cycle_check_main,
    'tsp-nn': tsp_check_main,
    'tsp-mst': tsp_check_main,
    'tsp-nn-2opt': tsp_check_main,
    'tsp-mst-2opt': tsp_check_main,
}

class MyReporter(SimpleReporter):
    def __init__(self):
        SimpleReporter.__init__(self, 'testes.log')
        self.stopwatch_test = Stopwatch()

    def start_test(self, test_case):
        super(MyReporter, self).start_test(test_case)
        self.stopwatch_test.start()

    def _on_success(self, test_case, test_result):
        if 'tsp' in test_case.description:
            custo = test_result.program_result.out.splitlines()[0]
            tempo = self.stopwatch_test.elapsed_str()
            self._write('OK (custo: %s, tempo: %s)\n' % (custo, tempo))
        else:
            tempo = self.stopwatch_test.elapsed_str()
            self._write('OK (tempo: %s)\n' % (tempo,))

def get_formatted_checkers():
    return '|'.join(sorted(c for c in CHECKERS))

def validade_progs(path, progs):
    if not progs:
        print u'Nenhum arquivo run executável encontrado em', path
        print u'Lembre-se de executar o comando "chmod -f +x src/lang/{run,build}"'
        print u'onde lang é a linguagens escolhida para implementar o trabalho.'
        sys.exit(1)

def validade_cases(path, cases):
    if not cases:
        print u'Nenhum arquivo de teste encontrado em', path 
        sys.exit(1)

def show_usage():
    print u'Modo de usar: %s cases-path progs-path %s' % (sys.argv[0], get_formatted_checkers())

def main():
    if len(sys.argv) != 4:
        print u'Número inválido de parâmetros'
        show_usage()
        sys.exit(1)
    cases_path, progs_path, alg = sys.argv[1:]
    if alg not in CHECKERS:
        print u'Algoritmo inválido:', alg
        show_usage()
        sys.exit(1)
    if alg.startswith('tsp-'):
        cases_path = os.path.join(cases_path, 'tsp')
        ext = '.tsp'
    else:
        cases_path = os.path.join(cases_path, alg)
        ext = '.g'
    cases = load_cases(cases_path, in_ext=ext)
    validade_cases(cases_path, cases)
    progs = load_progs_info(progs_path, run_params = [alg])
    validade_progs(progs_path, progs)
    run_progs_cases(CHECKERS[alg], progs, cases, MyReporter())

if __name__ ==  '__main__':
    main()
