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
    deps=[':bare', ':requirements'],
)


py_library(
    name='bare',
    srcs=glob(['*.py']),
    data=glob(['resources/*']),
)


py_test(
    name='test',
    srcs=['test.py'],
    deps=[':src']
)
