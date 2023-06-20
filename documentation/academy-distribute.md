# ACADEMY-DISTRIBUTE 1 2021-02-14 GNU "User Manuals"

## NAME

Academy-Distribute - distribute an assignment among users

## SYNOPSIS

`academy distribute` [`-ahilnps`]

## DESCRIPTION

This script distributes files from WORKING_DIR into NAMESPACE/[PREFIX]USERNAME for each USERNAME from stdin. For existing projects creates merge requests if files in WORKING_DIR have changed.

## OPTIONS

`-a`, `--assign WHEN`
       Assign developer role to users for newly created projects and assign users to issues `always`, `never`, or according to account existence `auto` (default).

`-d`, `--default-branch-namespace BRANCH`
       Collect editable files from `BRANCH` solutions instead of distributing to students.

`-h`, `--help`
       Display usage.

`-i`, `--process-issues LABEL`
       Copy issues marked with `LABEL` into destination repositories. Note: `WORKING_DIR` must be a GitLab project.

`-l`, `--update-links`
       Replace all occurrences of the assignment project's remote URL and its current branch with destination repository remote URL and its main branch in `README.md`. Note: `WORKING_DIR` must be a GitLab project.

`-n`, `--dry-run`
       Only process options and stdin validation. Would not proceed with create or update user repositories.

`-o`, `--output-dir DIR`
       Store distributed repositories in DIR. Uses `mktemp` by default.

`-p`, `--prefix PREFIX`
       Prepend PREFIX in front of each repository name. PREFIX is empty by default.

`-s`, `--namespace NAMESPACE`
       Distribute repositories into NAMESPACE instead of the current project's namespace.

## EXIT STATUS

1      Other error.

2      Invalid options or arguments including empty or missing stdin.

3      Some (or all) invalid users.

## EXAMPLES

```
echo "student1 student2 student3" | academy distribute -l -p "java01-" -s "internetguru/academy/tutorial/group1"
```

Given example distributes current directory into the following locations. The `-l` option updates links in README files.

```
internetguru/academy/tutorial/group1/java01-student1
internetguru/academy/tutorial/group1/java01-student2
internetguru/academy/tutorial/group1/java01-student3
```

The following example does the same job dynamically. Assuming you are in a `java01` folder on branch `group1`.

```
grep 'ACADEMY_ASSIGN:' .gitlab-ci.yml | cut -d'"' -f2 | academy distribute -l -p "$(basename $PWD)-" \
  -s "internetguru/academy/tutorial/$(git rev-parse --abbrev-ref HEAD)"
```

Note: Running the command dynamically is a number one prevention from accidentally distributing a different lab or even a working solution to all students. Different branch would create a separate namespace and different folder would distribute the assignment into appropriate lab repositories.

## BUGS

n/a

## AUTHOR

George J. Pavelka <george@internetguru.io>

## SEE ALSO

`academy`(1), `academy-evaluate`(1), `academy-execute`(1)
