# Sample Python Repository

This repo outlines a simple python project.

# Develop

#### sample
This is where all the code lies. It includes a `hello.py` file with some simple classes and methods.
#### command_line.py
Many python packages include command line tools and we have created one here using the `console_scripts` entry point
of setup.py. In order to test this, after building your environment using setup.py, go to the terminal and type
 `greet`, you will be welcomed by a message :)

#### Vagrant
[Vagrant](https://www.vagrantup.com/) is a tool for building and managing virtual machine environments.It provides easy 
to configure, reproducible, and portable work environments with the help of Vagrantfile.

#### Vagrantfile
[Vagrantfile](https://www.vagrantup.com/docs/vagrantfile/) describes the type of machine required for the sample project and how to configure it.
Vagrant needs to be installed to run this file. Upon executing `vagrant up` under this folder, it would setup the box.
Then, you can execute `vagrant ssh` to log into the box and start working on the project immediately.
It strips off the hurdle of setting up the environment for your project.
Note: You'll have to enter into the app directory inside vagrant as that's where the project resides 

# Test
Testing is required for an effective performance of software application or product. There is a test directory under sample folder where the tests for `hello.py` are written.

#### Unit tests (sample/tests/unit/unit_tests.py)
Unit testing involves testing an individual unit, such as a method (function) in a class, with all dependencies mocked up.
Here, we are leveraging the [mock](https://pypi.python.org/pypi/mock) library. 


# Build

#### [Setup.py](https://docs.python.org/2/distutils/setupscript.html)
This file helps to set up the environment needed to smoothly run the project. Other than installing the dependencies, it also creates the packages which the project would utilize
In order to build your own packages, type in `pip install -U .` This will ensure that all requirements are installed. 
But before doing that, explore the concept of `virtualenv`[virtual environments](https://virtualenv.pypa.io/en/stable/userguide/). These help us to create isolated python environments, thereby keeping the global
environment clean. 

# Automation 
#### tools/check.sh
Upon executing this shell script, it runs [pylint](https://www.pylint.org/) with specified configuration against
the code. It then runs [pytest](https://docs.pytest.org/en/latest/) against the tests directory, basically executing the 
unit and functional tests written for `hello.py`

#### tools/run_tests.sh
This can help you run linting or different checks more granularly.
`tools/run_tests.sh -h` will list out all the options that can be used here. If no option is specified then it runs the unit
tests and gives a nice report using [coverage](https://coverage.readthedocs.io/en/coverage-4.4.1/).
You can also do a pep8 check by running `tools/run_tests.sh -p` and run functional tests by typing `tools/run_tests.sh -f`

Please note that, `run_tests.sh` and `check.sh` are all part of the tools directory.
