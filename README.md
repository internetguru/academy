
[![tests badge at master](https://github.com/InternetGuru/ams/workflows/tests/badge.svg?branch=master)](https://github.com/InternetGuru/ams/actions?query=branch%3Amaster)
[![tests badge at dev](https://github.com/InternetGuru/ams/workflows/tests/badge.svg?branch=dev)](https://github.com/InternetGuru/ams/actions?query=branch%3Adev)

# Assignment Management System | AMS

> This script provides commands to _distribute_ coding assignments to solvers, _evaluate_ individual solutions and _measure_ similarities between each other.

## Requirements

* Installed `git` with defined user and email
* Installed `jq`, see https://stedolan.github.io/jq/
* Installed `go-md2man` (optional)

## Installation

- To install locally, simply clone this project and set an alias.

   ```sh
   git clone https://github.com/InternetGuru/ams.git
   echo alias ams=\"$PWD/ams/ams\" >> ~/.bashrc
   source ~/.bashrc
   ```

- For global installation, clone this project into shared folder and create a symbolic link.

   ```sh
   sudo git clone https://github.com/InternetGuru/ams.git /usr/local/src
   sudo ln -s "/usr/local/src/ams/ams" /usr/local/share/ams
   ```

- To install `man` documentation, run the following script. (optional)
   ```sh
   sudo ./install.sh
   ```

## GitLab CI Usage

1. Make sure you have your [personal access token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#creating-a-personal-access-token). On GitLab [set ACCESS_TOKEN variable](https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui) into your root namespace.

   - E.g. into `umiami/george`

1. Navigate into the project and switch to the branch with assignment. Make sure [the branch is protected](https://docs.gitlab.com/ee/user/project/protected_branches.html).

   - E.g. [umiami/george/csc220/lab01@fall20](https://gitlab.com/umiami/george/csc220/lab01/-/tree/fall20)

1. To distribute the assignment to 3 test solvers, evaluate, collect and measure, add the following lines to your `.gitlab-ci.yml` file (create one if it doesn't exist).

   ```yaml
   include:
     - 'https://raw.githubusercontent.com/InternetGuru/ams/dev/gitlab-stages.yml'

   variables:
     AMS_AUTOEVAL: "true"
     AMS_USERS: "solver1 solver2 solver3"
     AMS_MOSSURL: "https://some.url/moss"
   ```
   - For other variables refer to documentation section.

1. The `ams evaluate` command runs automatically after each push. To execute other commands (`ams collect`, `ams distribute`, `ams measure`), [trigger their pipeline manually](https://docs.gitlab.com/ee/ci/pipelines/#run-a-pipeline-manually). Make sure you trigger the pipeline on desired branch.

1. Display badges in `README.md` file with links to appropriate log files (evaluate process):

   ```markdown
   [![pipeline status](https://gitlab.com/${PROJECT}/badges/${BRANCH}/pipeline.svg)](https://gitlab.com/${PROJECT}/-/pipelines?ref=${BRANCH})
   [![compile](https://gitlab.com/${PROJECT}/builds/artifacts/${BRANCH}/raw/.results/compile.svg?job=evaluate)](https://gitlab.com/${PROJECT}/-/jobs/artifacts/${BRANCH}/file/.results/compile.log?job=evaluate)
   [![checkstyle](https://gitlab.com/${PROJECT}/builds/artifacts/${BRANCH}/raw/.results/checkstyle.svg?job=evaluate)](https://gitlab.com/${PROJECT}/-/jobs/artifacts/${BRANCH}/file/.results/checkstyle.log?job=evaluate)
   [![test](https://gitlab.com/${PROJECT}/builds/artifacts/${BRANCH}/raw/.results/test.svg?job=evaluate)](https://gitlab.com/${PROJECT}/-/jobs/artifacts/${BRANCH}/file/.results/test.log?job=evaluate)
   ```

   - Replace `${PROJECT}` with your actual project's link, e.g. `umiami/george/csc220/lab01`.
   - Replace `${BRANCH}` with an actual branch, e.g. `master`.

## Licensing

TODO
