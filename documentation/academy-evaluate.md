# ACADEMY-EVALUATE 1 2021-02-14 GNU "User Manuals"

## NAME

Academy-Evaluate - evaluate project and create status badges

## SYNOPSIS

`academy evaluate`

## DESCRIPTION

With each evaluation, the following scripts are run when found in the `.academy` folder. Filenames are ... For some languages, there are predefined scripts to be run by default.

TODO desc: syntax bash, automatically runned in CI job, generating badges for Dashboard, mark output of specific file for dashboard

 - `pre-evaluate_${ACADEMY_LANG}`
   - define default badges (example)
   - define folders, variables, ...
 - `evaluate_${ACADEMY_LANG}`
   - process evaluation, use run_io_tests function
   - generate badges
   - output marks for Dashboard
   %% file start ${fileName} %%
   %% file end ${fileName} %%
 - `post-evaluate_${ACADEMY_LANG}`

### `run_io_tests` function

This function performs simple I/O tests. It accepts one parameter of a command run syntax.

For each folder from `iotest//*` the function defines a `FILE_PATH` variable e.g. `src/SumClass.java`. To use the variable, make sure it is not expanded, e.g. `run_io_tests "java \${FILE_PATH}"` or `run_io_tests ‘java ${FILE_PATH}’`.

For each `test_name.file_ext` in the folder, the function performs set of tests per `test_name` supporting the following extensions: `stdin`, `stdout`, `optarg` (not implemented), `sc`, `errout`.

Example folder structure for `/src/SumClass.java` class IO tests:
```
/
├── src
|   └── SumClass.java
└── iotest/src/SumClass.java
    ├── foo.stdin
    ├── foo.stdout
    ├── foo.errout
    ├── bar.stdout
    ├── hello.optarg
    ├── hello.sc
    ├── world.errout
    └── …
```

### `generate_badge` function

This function is an extension to shields.io to generate svg badges with link and title. The code to display badges (in README etc.) is available in the meta job output.

The function accepts the following parameters:
   - `label`, e.g. “Code quality” (required)
   - `value`, e.g. “100%” (required)
   - `color`, see defaults below, see [Shields.io Colors section](https://shields.io#colors)
   - `file name`, e.g. “01-code-quality”
   - `link`, e.g. an URL to logs
   - `title`, e.g. “View logs”

Default value for `color` (if empty) depend on `value` in the following way. Fractions and percentages (e.g. “3/6” or “50%”) result in corresponding color from green to red. Other values result in the “inactive” value (which is gray).

## OPTIONS

n/a

## EXIT STATUS

1      Other error.

## EXAMPLES

TODO

## BUGS

TODO

## AUTHOR

George J. Pavelka <george@internetguru.io>

## SEE ALSO

`academy`(1), `academy-distribute`(1), `academy-execute`(1)


[Google Java Style Guide](https://google.github.io/styleguide/javaguide.html)

[How to write doc comments for the javadoc tool](https://www.oracle.com/technical-resources/articles/java/javadoc-tool.html)

[Apache Maven](https://maven.apache.org/)

[checkstyle](https://checkstyle.sourceforge.io/)

[Maven checkstyle plugin](https://maven.apache.org/plugins/maven-checkstyle-plugin/)

[GitLab job artifacts](https://docs.gitlab.com/ee/ci/pipelines/job_artifacts.html)

[Shields.io](https://shields.io/)


[Checkstyle for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=shengchen.vscode-checkstyle)

[Checkstyle for Eclipse](https://checkstyle.org/eclipse-cs/#!/)

[Checkstyle for NetBeans](https://checkstyle.org/netbeans.html)

[Checkstyle for Intellij IDEA](https://checkstyle.org/idea.html)
