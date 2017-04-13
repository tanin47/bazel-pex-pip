git_repository(
    name = "io_bazel_rules_pex",
    remote = "https://github.com/tanin47/bazel_rules_pex.git",
    tag = "0.3.0",
)

load('//:pypi.bzl', 'pip', 'pip_package')
load("@io_bazel_rules_pex//pex:pex_rules.bzl", "pex_repositories")

pip()
pip_package(name='oauth2client', version='4.0.0')
pip_package(name='appdirs', version='1.4.3')
pex_repositories()

