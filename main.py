
def main():
  print "Current file's path: %s" % __file__

  import appdirs
  print "appdirs' path: %s" % appdirs.__file__

  import oauth2client
  print "oauth2client' path: %s" % oauth2client.__file__

  import os
  path = os.path.join(os.path.dirname(__file__), 'resources', 'test.json')

  with open(path) as f:
    content = f.read().strip()
    print "Test.json's content: %s" % content

  assert '.pex' in __file__, '%s should be in .pex.' % __file__
  assert '.pex' in appdirs.__file__, '%s should be in .pex.' % appdirs.__file__
  assert 'TEST' == content, '%s should have been TEST.' % content

  print 'Finished.'


if __name__ == '__main__':
  main()
