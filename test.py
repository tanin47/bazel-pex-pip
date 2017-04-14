
import os
import sys
import appdirs
import unittest


def main():
  suites = unittest.loader.TestLoader().discover(
      '.',
      pattern='*_test.py',
      top_level_dir='.')

  result = unittest.TextTestRunner(
      verbosity=1, buffer=False).run(suites)

  if result.errors or result.failures:
    sys.exit(1)


if __name__ == '__main__':
  main()
