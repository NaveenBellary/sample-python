# function definitions
help(){
    echo "Usage: $0 [OPTION]..."
    echo "  -h, --help         Show this help output"
    echo "  -p, --pep8         Run pep8 checks"
    echo "  -l, --lint         Run pylint checks and some extra custom style checks"
    echo "  -pl, --pl        Run pep8 and pylint checks"
    echo "  --no-coverage      Don't make a unit test coverage report"
    echo ""
    exit 0;
}

fail(){
    echo "FAILURE"
    echo -e "$1"
    exit 1;
}

run_python_tests(){
    OMIT="sample/tests/*"
    INCLUDE="sample/*"
    coverage run --omit=$OMIT --include=$INCLUDE -m pytest -rw -s sample/tests/"$1" $testargs

    TEST_RESULT=$?

    if [ $include_coverage -eq 1 ]; then
        COVERAGE_REPORT=$(coverage report -m)
        echo "$COVERAGE_REPORT"
    fi

    if [ $TEST_RESULT  -gt 0 ]; then
        exit $TEST_RESULT;
    fi

    if [ $include_coverage -eq 1 ]; then
        # Make sure each file has a minium test coverage of 70%
        UNDER_TRESHOLD=$(echo "$COVERAGE_REPORT" | grep "%" | awk 'int($4) < 70')
        if [ -n "$UNDER_TRESHOLD" ]; then
            echo -e "\n"
            echo "Some test are not meeting the minimum test coverage of 80%:"
            echo "$UNDER_TRESHOLD"
            exit 1;
        fi
    fi
}

run_unit_tests(){
    run_python_tests "unit/unit_tests.py"
}

run_functional_tests(){
    run_python_tests "functional/functional_tests.py"
}


run_pep8_check(){
    echo "************** Running pep8 checks ********************************"
    pep8 sample/ --max-line-length=120
    echo "SUCCESS"
}

run_lint_check(){
    echo "************** Running pylint checks ******************************"
    pylint sample/ --rcfile=".pylintrc"
    echo "SUCCESS"
}


# Determine script behavior based on passed options

# default behavior
just_pep8=0
just_lint=0
just_unit=0
just_func=0
testargs=""
include_coverage=1
all_style_checks=0

while [ "$#" -gt 0 ]; do
    case "$1" in
        -h|--help) shift; help;;
        -p|--pep8) shift; just_pep8=1;;
        -l|--lint) shift; just_lint=1;;
        -u|--unit) shift; just_unit=1;;
        -f|--func) shift; just_func=1;;
        -pl|--pl) shift; all_style_checks=1;;
        --no-coverage)shift; include_coverage=0;;
        *) testargs="$testargs $1"; shift;
    esac
done



if [ $just_unit -eq 1 ]; then
    run_unit_tests
    exit $?
fi

if [ $just_func -eq 1 ]; then
    run_functional_tests
    exit $?
fi

if [ $just_pep8 -eq 1 ]; then
    run_pep8_check
    exit $?
fi

if [ $just_lint -eq 1 ]; then
    run_lint_check
    exit $?
fi

if [ $all_style_checks -eq 1 ]; then
    run_pep8_check
    run_lint_check
    exit $?
fi

run_unit_tests || exit
