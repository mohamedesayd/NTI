#!/usr/bin/env bash
# Usage (options first, then one or more test names):
#   ./run.sh my_test
#   ./run.sh -v UVM_LOW -s 1234 test_a test_b
#   ./run.sh -f tests.txt          (one test name per line)
#   ./run.sh -n test_a test_b
VERBOSITY="UVM_MEDIUM"
SEED="random"
NOCOMPILE=0
FILE=""

while getopts "v:s:f:n" opt; do
  case "$opt" in
    v) VERBOSITY="$OPTARG" ;;
    s) SEED="$OPTARG" ;;
    f) FILE="$OPTARG" ;;
    n) NOCOMPILE=1 ;;
    *) echo "Usage: $0 [-v verbosity] [-s seed] [-f file] [-n] [test1 test2 ...]"; exit 1 ;;
  esac
done
shift $((OPTIND - 1))

TESTS=("$@")
[ -n "$FILE" ] && TESTS+=($(cat "$FILE"))

mkdir -p logs

if [ "$NOCOMPILE" -eq 0 ]; then
  [ -d work ] || vlib work
  vlog -cover sbceft -sv -f listfile.f -l logs/compile.log || exit 1
fi

for t in "${TESTS[@]}"; do
  vsim -c -voptargs=+acc work.tb_top "+UVM_TESTNAME=$t" "+UVM_VERBOSITY=$VERBOSITY" \
       -sv_seed "$SEED" -l "logs/$t.log" -do "run; coverage report -cvg; coverage report;quit -f"
done
