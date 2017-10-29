# https://en.wikipedia.org/wiki/Unit_testing

import unittest
import mock
from sample import hello


class TestWelcome(unittest.TestCase):
    """
    Unit test case for the welcome class of hello.py
    """
    def setUp(self):
        self.welcome = hello.YodaWelcome(name='Optimus')

    def tearDown(self):
        pass

    @mock.patch('sample.hello.YodaWelcome.greet')
    def test_greet_accepts_message(self, mockgreet):
        """
        Asserts whether the greet function accepts a message
        :return: None
        """
        message = 'Nice to meet you!'
        self.welcome.greet(message)

        mockgreet.assert_called_once_with(message)

    def test_greet_raises_error_if_no_message_is_passed(self):
        """
        Asserts whether the greet function raises error when no message is passed
        :return: None
        """
        with self.assertRaises(TypeError):
            self.welcome.greet() 		# pylint: disable=no-value-for-parameter


if __name__ == '__main__':
    unittest.main()
