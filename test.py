
import appdirs
import unittest

import main

class MainTest(unittest.TestCase):

  def test_main(self):
    print appdirs.__file__
    with self.assertRaises(AssertionError) as cm:
      main.main()


if __name__ == '__main__':
  unittest.main()
