
[![tests badge at master](https://github.com/InternetGuru/ca/workflows/tests/badge.svg?branch=master)](https://github.com/InternetGuru/ca/actions?query=branch%3Amaster)
[![tests badge at dev](https://github.com/InternetGuru/ca/workflows/tests/badge.svg?branch=dev)](https://github.com/InternetGuru/ca/actions?query=branch%3Adev)

# Coding Assignment | CA

> This script provides commands to _distribute_ coding assignments to solvers, _evaluate_ individual solutions and _measure_ similarities between each other.

## Requirements

* Installed `git` with defined user and email
* Installed `jq`, see https://stedolan.github.io/jq/
* Installed `go-md2man` (optional)

## Installation

- To install locally, simply clone this project and set an alias.

   ```sh
   git clone https://github.com/InternetGuru/ca.git
   echo alias ca=\"$PWD/ca/ca\" >> ~/.bashrc
   source ~/.bashrc
   ```

- For global installation, clone this project into shared folder and create a symbolic link.

   ```sh
   sudo git clone https://github.com/InternetGuru/ca.git /usr/local/src
   sudo ln -s "/usr/local/src/ca/ca" /usr/local/share/ca
   ```

- To install `man` documentation, run the following script. (optional)
   ```sh
   sudo ./install.sh
   ```

## GitLab CI Usage

1. Make sure you have your [personal access token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#creating-a-personal-access-token). On GitLab [set ACCESS_TOKEN variable](https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui) into your root namespace.

   - E.g. into `umiami/george`

1. Navigate into the project and switch to the branch you want to process. Make sure [the branch is protected](https://docs.gitlab.com/ee/user/project/protected_branches.html).

   - E.g. [umiami/george/csc220/lab01@spring21](https://gitlab.com/umiami/george/csc220/lab01/-/tree/spring21)

1. Add the following lines into your `.gitlab-ci.yml` file (create one if it doesn't exist) and choose what you want process by adding specific variables. E.g. if your main branch contains solution and another branch contains assignment, you want to distribute the other branch and measure the main branch (against assignment solutions). You probably want to evaluate both branches.

   ```yaml
   include:
     # Mandatory include with variable branch name, e.g. "dev"
     - 'https://raw.githubusercontent.com/InternetGuru/ca/dev/gitlab-stages.yml'

   variables:
     # To run distribute script
     CA_DISTRIBUTE: "true"
     # Distribute issues only with "assignment" label
     # Default value is current branch, e.g. "spring21"
     CA_ISSUES: "assignment"
     # List of users to distribute to separated by spaces
     CA_USERS: "solver1 solver2 solver3"

     # To run evaluate script
     CA_EVALUATE: "true"

     # To run collect script
     CA_COLLECT: "true"
     # To specify source files
     CA_SOURCE: "branch"
     #
     CA_DEADLINE: "date"
     #
     CA_EDITABLE: "pattern"

     # To run measure script
     CA_MEASURE: "true"
     # Link to public moss script
     CA_MOSSURL: "https://moss_url"
     # Which branches to measure (optional)
     # Measure all branches when this variable is missing
     CA_BRANCHES: "branch1 branch2 branch3"
   ```

1. To run the CA script on demand, [trigger CI pipeline manually](https://docs.gitlab.com/ee/ci/pipelines/#run-a-pipeline-manually) on chosen branch. Note: evaluate process is triggered automatically after each commit.

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
