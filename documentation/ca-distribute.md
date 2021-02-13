
# CA Distribute

> The `distribute.sh` script distributes a source folder or a repository _(detaching its history)_ into one or more GitLab repositories (projects). To preserve the assignment's history, a separate `source` branch is used for pull requests into main branch when updated from the source using the same script. Additionally individual GitHub issues marked with an `assignment` label are copied into newly created repositories.

Newly created projects are public unless a matching GitLab user is found. In that case, the user gains developer rights and is assigned to created issues. Consequently the project's visibility is set to private.

Note: This project provides GitLab CI template (see below).

## Requirements

* Installed `jq`, see https://stedolan.github.io/jq/
* Installed `git` with defined user and email
* Existing (working) project with assignment branch or assignment project
* GitLab account
* List of solvers, possibly as GitLab user accounts

## Installation

- To install locally, simply clone this project and set an alias.

   ```
   git clone https://github.com/InternetGuru/cad.git
   echo alias cad=\"$PWD/cad/distribute.sh\" >> ~/.bashrc
   source ~/.bashrc
   ```

- For global installation, clone into shared folder and create a symbolic link.

   ```
   sudo git clone https://github.com/InternetGuru/cad.git /usr/local/src
   sudo ln -s "/usr/local/src/cad/distribute.sh" /usr/local/share/cad
   ```

## CLI Usage

- Clone a GitLab assignment project and distribute it into individual solver repositories.

   ```
   git clone https://gitlab.com/umiami/george/csc220/matrix
   cad -n "umiami/george/csc220/sols" -f matrix -u "user1 user2"
   ```

- Clone GitLab assignment project into individual solver repositories on specific branch replacing README remote links. This is equivalent to our example of CI usage (below).

   ```
   git clone https://gitlab.com/umiami/george/csc220/matrix
   git -C matrix checkout fall20
   cad -rn "umiami/george/csc220/fall20/matrix" -f matrix -u "solver1 solver2 solver3"
   ```

## GitLab CI Usage

1. Make sure you have your [personal access token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#creating-a-personal-access-token). On GitLab [set ACCESS_TOKEN variable](https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui) into your root namespace.

   - E.g. into `umiami/george`

1. Navigate into the project and switch to the branch you want to distribute. Make sure [the branch is protected](https://docs.gitlab.com/ee/user/project/protected_branches.html).

   - E.g. [umiami/george/csc220/matrix@fall20](https://gitlab.com/umiami/george/csc220/matrix/-/tree/fall20)

1. Add the following lines into your `.gitlab-ci.yml` file and insert users into `CAD_USERS` variable separated by space, e.g. `"solver1 solver2 solver3"`. You may want to select a different `distribute.sh` revision. Do not modify `CAD_REVISION` variable unless you know what you're doing.

   ```
   include: 'https://raw.githubusercontent.com/InternetGuru/cad/master/gitlab-distribute.yml'

   variables:
     CAD_USERS: ""
     CAD_REVISION: "1"

   stages:
     - distribute
   ```

1. To distribute the assignment, [run **distribute stage** in CI pipeline](https://docs.gitlab.com/ee/ci/pipelines/#run-a-pipeline-manually) on desired branch. Destination namespace for assignment projects is `project_namespace/project_branch/project_name`.

   - E.g. destination namespace is [umiami/george/csc220/fall20/matrix](https://gitlab.com/umiami/george/csc220/fall20/matrix)

## Suggestions

- [x] Integrate linting check (Shellcheck).
- [ ] Enhance automatic testing (BUTT).
- [x] Add changelog and semantic versioning (git flow).
- [ ] Configurable destination projects visibility (private / public).
- [x] Standalone assignment support with no base project or with no git at all.
- [ ] Support --quiet / default / --verbose mode.
- [x] Set users as developers by parameter `-d,--developer=ALWAYS|AUTO|NEVER` (default `AUTO`).
- [ ] Introduce dry run to verify parameters and print out destinations.
- [ ] In distributed projects make the `source` branch protected.
- [ ] Specify editable files.
- [ ] Add GitHub support.
- [ ] Add source project visibility check.
- [x] Copy issues into newly created repositories.

[1]: https://docs.gitlab.com/ee/user/group/
[2]: https://about.gitlab.com/product/continuous-integration/
