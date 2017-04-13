_BUILD_FILE = """
py_library(
    name = 'pip_tools',
    srcs = glob(
        include = ['bin/**/*', 'site-packages/**/*'],
        exclude = [
            # Illegal as Bazel labels but are not required by pip.
            "site-packages/setuptools/command/launcher manifest.xml",
            "site-packages/setuptools/*.tmpl",
        ]
    ),
    visibility = ['//visibility:public']
)
"""


def _pip_tools_impl(ctx):
    getpip = ctx.path(ctx.attr._getpip)
    tools = ctx.path('site-packages')

    command = ['python', str(getpip)]
    command += list(ctx.attr.packages)
    command += ['--target', str(tools)]
    command += ['--install-option', '--install-scripts=%s' % ctx.path('bin')]
    command += ['--no-cache-dir']

    result = ctx.execute(command)
    print(result.return_code)
    print(result.stdout)
    print(result.stderr)
    ctx.file('BUILD', _BUILD_FILE, False)


_pip_tools = repository_rule(
    _pip_tools_impl,
    attrs={
        'packages': attr.string_list(),
        '_getpip': attr.label(
            default=Label('@getpip//file:get-pip.py'),
            allow_single_file=True,
            executable=True,
            cfg='host'
        )
    }
)


def pypi_repositories(packages=None):
    native.http_file(
        name="getpip",
        url="https://bootstrap.pypa.io/get-pip.py",
        sha256="19dae841a150c86e2a09d475b5eb0602861f2a5b7761ec268049a662dbd2bd0c"
    )

    _pip_tools(
        name="pypi",
        visibility=['//visibility:public'],
        packages=packages if packages else []
    )

    native.bind(
        name="pip_tools",
        actual="@pypi//:pip_tools",
    )
