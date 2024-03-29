# ACADEMY 1 2021-02-16 GNU "User Manuals"

## NAME

Academy - coding assignment handling

## SYNOPSIS

`academy` [`-w`] `<command>` [`<args>`]

## DESCRIPTION

Provides commands to _distribute_ coding assignments to students, _evaluate_ or _execute_ individual solutions.

## OPTIONS

-w, --working-dir WORKING_DIR
       Run as if ${SCRIPT} was started in WORKING_DIR instead of the current working directory.

## COMMANDS

These are common academy commands used in various situations:

distribute
       Create or update user repositories with files from source project.

execute
       Execute code to see output on the fly.

evaluate
       Verify project and generate badges for README.

help
       Display this usage.

## VARIABLES

DIR
       Academy directory path.

WORKING_DIR
       Wokrking directory path.

CHANGED_FILES
       List of changed files. Available for `execute` and `evaluate` scripts.

## EXIT STATUS

1      Other error.

## EXAMPLES

TODO

## BUGS

TODO

## AUTHOR

George J. Pavelka <george@internetguru.io>

## SEE ALSO

`academy-distribute`(1), `academy-evaluate`(1), `academy-execute`(1)
