set -e

pip install .

# FLAKE 8
# H307: like imports should be grouped together
# H405: multi line docstring summary not separated with an empty line
# H803: git title must end with a period
# H904: Wrap long lines in parentheses instead of a backslash
# H802: git commit title should be under 50 chars
# H701: empty localization string
FLAKE8_IGNORE="H307,H405,H803,H904,H802,H701"
# exclude settings files and virtualenvs
FLAKE8_EXCLUDE="*settings.py,*.venv/*.py"
printf "************Running flake8************\n"
flake8 --ignore=$FLAKE8_IGNORE --max-line-length=120 --exclude=lib,plugins_list.py,activate_this.py sample
printf "************flake8 finish************\n"
printf "************Running pylint************\n"
./tools/run_tests.sh -l
printf "************pylint finish************\n"
printf "************Running Unit Tests************\n"
./tools/run_tests.sh -u
printf "************Unit tests finish************\n"