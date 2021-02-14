# CA-DISTRIBUTE 1 2021-02-14 GNU "User Manuals"

## NAME

CA Distribute - distribute assignment among users

## SYNOPSIS

`ca distribute` [`-adhiln`] `REMOTE_NAMESPACE`

## DESCRIPTION

TODO

## OPTIONS

`-a`, `--assign WHEN`
       Assign `ROLE` (see below) to users for newly created projects and assign users to issues `always`, `never`, or `auto` (default).

`-d`, `--directory PROJECT_FOLDER`
       Specify the `PROJECT_FOLDER` (default PWD).

`-h`, `--help`
       Display usage.

`-i`, `--process-issues`
       Copy issues marked with 'assignment' label into destination repositories. `PROJECT_FOLDER` must be a GitLab project.

`-l`, `--update-links`
       Replace all occurrences of the assignment project's remote URL and its current branch with destination repository remote URL and its main branch in `README.md`. `PROJECT_FOLDER` must be a GitLab project.

`-n`, `--dry-run`
       Only process arguments, options and stdin validation. Would not proceed with create or update user repositories.

## EXIT STATUS

1      Other error.

2      Invalid options or arguments including empty or missing stdin.

3      Some (or all) invalid users.

## EXAMPLES

TODO (?)

## BUGS

TODO link to github (?)

## AUTHOR

TODO name <email>

## SEE ALSO

TODO other manuals, other links (?)
