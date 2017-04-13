git_repository(
    name = "subpar",
    remote = "https://github.com/google/subpar",
    commit = "edb8409041b521959b6ed4b7412c0eec59d4af78",
)

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

