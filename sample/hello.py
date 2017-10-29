class YodaWelcome(object):
    """
    Class where Yoda welcomes a new Jedi!
    """
    def __init__(self, name='Jedi'):
        self.name = name

    def __str__(self):
        return self.__class__.__name__

    def greet(self, message):
        """
        Function to print a greeting message

        :param message: Message that can be used to greet
        :type  message: String
        :return: None
        """
        print "Hello {name}, {message}".format(name=self.name, message=message)
