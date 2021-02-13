
[![tests badge at master](https://github.com/InternetGuru/ca/workflows/tests/badge.svg?branch=master)](https://github.com/InternetGuru/ca/actions?query=branch%3Amaster)
[![tests badge at dev](https://github.com/InternetGuru/ca/workflows/tests/badge.svg?branch=dev)](https://github.com/InternetGuru/ca/actions?query=branch%3Adev)

# Coding Assignment | CA

> TODO

## GitLab CI Usage

1. Make sure you have your [personal access token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#creating-a-personal-access-token). On GitLab [set ACCESS_TOKEN variable](https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui) into your root namespace.

   - E.g. into `umiami/george`

1. Navigate into the project and switch to the branch you want to process. Make sure [the branch is protected](https://docs.gitlab.com/ee/user/project/protected_branches.html).

   - E.g. [umiami/george/csc220/matrix@fall20](https://gitlab.com/umiami/george/csc220/matrix/-/tree/fall20)

1. Add the following lines into your `.gitlab-ci.yml` file and choose what you want process by adding specific variables.

```yaml
include:
  - 'https://raw.githubusercontent.com/InternetGuru/ca/dev/gitlab-stages.yml'

variables:
  # Run distribution script
  # Destination namespace for assignment projects is `project_namespace/project_branch/project_name-user`
  CA_DISTRIBUTE: "true"
  # Users for distribution separated by spaces
  CA_USERS: "solver1 solver2 solver3"

  # Run evaluation script
  # It generates badges for README file (see below)
  CA_EVALUATE: "true"

  # Run measure script
  # You will find the URL with Moss results at the end of the pipeline output log
  CA_MEASURE: "true"
  # Link to public moss script
  CA_MOSSURL: "https://moss_url"

```

1. To run desired process, [run CI pipeline manually](https://docs.gitlab.com/ee/ci/pipelines/#run-a-pipeline-manually) on chosen branch. Note: evaluate process is automatic.


1. Display badges in `README.md` file with links to appropriate log files (evaluate process):

   ```md
   [![pipeline status](https://gitlab.com/$PROJECT_NS/badges/$BRANCH/pipeline.svg)](https://gitlab.com/$PROJECT_NS/-/pipelines?ref=$BRANCH)
   [![compile](https://gitlab.com/$PROJECT_NS/builds/artifacts/$BRANCH/raw/.results/compile.svg?job=evaluate)](https://gitlab.com/$PROJECT_NS/-/jobs/artifacts/$BRANCH/file/.results/compile.log?job=evaluate)
   [![checkstyle](https://gitlab.com/$PROJECT_NS/builds/artifacts/$BRANCH/raw/.results/checkstyle.svg?job=evaluate)](https://gitlab.com/$PROJECT_NS/-/jobs/artifacts/$BRANCH/file/.results/checkstyle.log?job=evaluate)
   [![test](https://gitlab.com/$PROJECT_NS/builds/artifacts/$BRANCH/raw/.results/test.svg?job=evaluate)](https://gitlab.com/$PROJECT_NS/-/jobs/artifacts/$BRANCH/file/.results/test.log?job=evaluate)
   ```

   - Replace `$PROJECT_NS` with your actual project namespace, e.g. `umiami/george/csc220/matrix`.
   - Replace `$BRANCH` with actual branch for current `README.md` file, e.g. `master` or `fall20`.
