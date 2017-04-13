load("@io_bazel_rules_pex//pex:pex_rules.bzl", "pex_binary")
load('//:requirements.bzl', 'requirements')


pex_binary(
    name='main',
    main='test.py',
    deps=[':bare'],
    # pex_binary doesn't read deps from :bare properly. This is why we refactor
    # requirements.
    reqs=requirements,
    # zip_safe=False unzips the pex file before running. This enables more
    # flexibility when using a resource file (e.g. executing it with bash).
    # This is the reason why we choose pex over subpar.
    zip_safe=False,
)


py_library(
    name='src',
    deps=[':bare', '//external:pip_tools']
)


py_library(
    name='bare',
    srcs=glob(['*.py']),
    data=glob(['resources/*']),
    deps=['//external:pip_tools']
)

