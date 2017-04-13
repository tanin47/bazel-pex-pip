Example of Bazel with pex and pip
==================================

This repo is a working example showing how to use [Bazel](https://bazel.build/)
with [pex](https://github.com/pantsbuild/pex) and
[pip](https://github.com/pypa/pip).

This repo is meant to be educational. Therefore, please read the code.

The example shows:

* pulls dependencies using pip
* builds a single binary with pex
* reads a resource file


Usage
-------

1. `bazel build main.pex`
2. `./bazel-bin/main.pex`

The output:

```
Current file's path: /usr/local/google/home/tanin/.pex/code/e7c476458b50c0339f6e515b84111b4dd9dee723/test.py
appdirs' path: /usr/local/google/home/tanin/.pex/install/appdirs-1.4.3-py2.py3-none-any.whl.88ca3acdb0294d36138be8eb8d73eb234d0cc1d3/appdirs-1.4.3-py2.py3-none-any.whl/appdirs.pyc
Test.json's content: TEST
Finished.
```

Notice that `appdirs` comes from within `.pex`.


Design Decision
-----------------

### Why do we choose pex over [subpar](https://github.com/google/subpar)?

Subpar doesn't support extracting resource files from the archive. If we have a
more complex resource file (e.g. a bash script), we can't execute it.

Pex, on another hand, can set `zip_safe=False` and extracts the archive before
execute the python code.


Special Thanks
----------------

* [The snippet](https://github.com/bazelbuild/bazel/issues/699#issuecomment-262091510) on pip integration from @trivigy
* [The pex integration](https://github.com/benley/bazel_rules_pex) from @benley
