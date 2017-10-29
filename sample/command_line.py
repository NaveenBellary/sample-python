#!/usr/bin/env python
import logging
from sample.hello import YodaWelcome
logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')


def main():
    """Main function goes here"""
    logging.debug('Instantiating the Welcome class')
    jedi = YodaWelcome()
    logging.debug('%s object created', jedi)
    message = 'May the force be with you!!'
    logging.debug('Calling the greet method')
    jedi.greet(message=message)


if __name__ == '__main__':
    main()
