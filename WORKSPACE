git_repository(
    name = "io_bazel_rules_pex",
    remote = "https://github.com/tanin47/bazel_rules_pex.git",
    tag = "0.3.0",
)

load('//:pypi.bzl', 'pypi_repositories')
load('//:requirements.bzl', 'requirements')
load("@io_bazel_rules_pex//pex:pex_rules.bzl", "pex_repositories")

pypi_repositories(requirements)
pex_repositories()

