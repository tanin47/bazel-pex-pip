load("@io_bazel_rules_pex//pex:pex_rules.bzl", "pex_binary")
load("//:requirements.bzl", "requirements")

pex_binary(
    name='main',
    main='main.py',
    deps=[':bare'],
    reqs=requirements,
    # zip_safe=False unzips the pex file before running. This enables more
    # flexibility when using a resource file (e.g. executing it with bash).
    # This is the reason why we choose pex over subpar.
    zip_safe=False,
)


py_library(
    name='src',
    deps=[':bare', '@requirements//:libraries'],
)


py_library(
    name='bare',
    srcs=glob(['main.py']),
    data=glob(['resources/*']),
)


py_test(
    name='test',
    srcs=['test.py'] + glob(['tests/**/*.py']),
    deps=[':src'],
    local=1
)


# The 2 rules below should be in tests/ and tests/fakeagain/, respectively.
# But if we created BUILD in those dirs, there would be scoping issues, and
# :test wouldn't work.
py_test(
    name='fake_test',
    srcs=['tests/fake_test.py'],
    deps=[':src'],
)


py_test(
    name='fake2_test',
    srcs=['tests/fakeagain/fake2_test.py'],
    deps=[':src'],
)

