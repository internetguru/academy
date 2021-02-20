# CA 1 2021-02-16 GNU "User Manuals"

## NAME

CA - coding assignment

## SYNOPSIS

`ca` [`-w`] `<command>` [`<args>`]

## DESCRIPTION

This script provides commands to _distribute_ coding assignments to solvers, _evaluate_ individual solutions and _measure_ similarities between each other.

## OPTIONS

-w, --working-dir WORKING_DIR
       Run as if ${SCRIPT} was started in WORKING_DIR instead of the current working directory.

## COMMANDS

These are common ca commands used in various situations:

distribute
       Create or update user repositories with files from source project.

evaluate
       Verify Java project and generate badges into README.

help
       Display this usage.

measure
       Compute software similarities between projects using Moss script.

## EXIT STATUS

1      Other error.

## EXAMPLES

TODO

## BUGS

TODO

## AUTHOR

George J. Pavelka <george@internetguru.io>

## SEE ALSO

`ca-distribute`(1), `ca-evaluate`(1), `ca-measure`(1)
