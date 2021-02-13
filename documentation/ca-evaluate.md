
# CA Evaluate

> This script evaluates GitLab Java projects on compilation, coding style and automatic tests. It generates colored summary badges and logs to be displayed and linked from projects' README files.

## GitLab CI Usage

1. Navigate into the project and switch to the branch you want to display badges in README file.

   - E.g. [umiami/george/csc220/matrix](https://gitlab.com/umiami/george/csc220/matrix)

1. Add the following lines into your `.gitlab-ci.yml` file. You may want to select a different evaluate script revision. Do not modify `CAE_REVISION` variable unless you know what you're doing.

   ```
   include:
     - 'https://raw.githubusercontent.com/InternetGuru/cae/master/gitlab-evaluate.yml'

   variables:
     CAE_REVISION: "1"

   stages:
     - evaluate
   ```

1. Display badges in `README.md` file with links to appropriate log files:

   ```
   [![pipeline status](https://gitlab.com/$PROJECT_NS/badges/$BRANCH/pipeline.svg)](https://gitlab.com/$PROJECT_NS/-/pipelines?ref=$BRANCH)
   [![compile](https://gitlab.com/$PROJECT_NS/builds/artifacts/$BRANCH/raw/.results/compile.svg?job=evaluate)](https://gitlab.com/$PROJECT_NS/-/jobs/artifacts/$BRANCH/file/.results/compile.log?job=evaluate)
   [![checkstyle](https://gitlab.com/$PROJECT_NS/builds/artifacts/$BRANCH/raw/.results/checkstyle.svg?job=evaluate)](https://gitlab.com/$PROJECT_NS/-/jobs/artifacts/$BRANCH/file/.results/checkstyle.log?job=evaluate)
   [![test](https://gitlab.com/$PROJECT_NS/builds/artifacts/$BRANCH/raw/.results/test.svg?job=evaluate)](https://gitlab.com/$PROJECT_NS/-/jobs/artifacts/$BRANCH/file/.results/test.log?job=evaluate)
   ```

   - Replace `$PROJECT_NS` with your actual project namespace, e.g. `umiami/george/csc220/matrix`.
   - Replace `$BRANCH` with actual branch for current `README.md` file, e.g. `master` or `fall20`.

## Checkstyle IDE Extensions

- [Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=shengchen.vscode-checkstyle)
- [Eclipse](https://checkstyle.org/eclipse-cs/#!/)
- [NetBeans](https://checkstyle.org/netbeans.html)
- [Intellij IDEA](https://checkstyle.org/idea.html)

## Suggestions

- [ ] Next to affected lines percentage, add a badge with list of errors/warnings types.

## Resources

- [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html)
- [How to write doc comments for the javadoc tool](https://www.oracle.com/technical-resources/articles/java/javadoc-tool.html)
- [Apache Maven](https://maven.apache.org/)
- [checkstyle](https://checkstyle.sourceforge.io/)
- [Maven checkstyle plugin](https://maven.apache.org/plugins/maven-checkstyle-plugin/)
- [GitLab job artifacts](https://docs.gitlab.com/ee/ci/pipelines/job_artifacts.html)
- [Shields.io](https://shields.io/)
