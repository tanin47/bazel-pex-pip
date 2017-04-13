load("@io_bazel_rules_pex//pex:pex_rules.bzl", "pex_binary")


pex_binary(
    name='main',
    main='main.py',
    deps=[':src'],
    # zip_safe=False unzips the pex file before running. This enables more
    # flexibility when using a resource file (e.g. executing it with bash).
    # This is the reason why we choose pex over subpar.
    zip_safe=False,
)


py_library(
    name='src',
    srcs=glob(['*.py']),
    data=glob(['resources/*']),
    deps=['@appdirs//:library', '@oauth2client//:library'],
)


py_test(
    name='test',
    srcs=['test.py'],
    deps=[':src']
)
