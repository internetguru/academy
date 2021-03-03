# CA-MEASURE 1 2021-02-14 GNU "User Manuals"

## NAME

CA-Measure - measure software similarities using Moss script

## SYNOPSIS

`ca measure` [`-hinps`]

## DESCRIPTION

Downloads all repositories from a NAMESPACE matching given PREFIX and measures software similarities between each other. Includes the current project (supposedly the sample solution). The link with evaluation results appears at the end of the script.

## OPTIONS

`-h`, `--help`
       Display usage.

`-i`, `--ignore`
       Ignore non-existing namespaces (EXIT STATUS 3).

`-n`, `--dry-run`
       Only process option validation. Would not proceed with cloning repositories and Moss execution.

`-p`, `--prefix PREFIX`
       From given NAMESPACE (below) add only projects with matching PREFIX (empty by default).

`-s`, `--namespace NAMESPACE`
       Add projects from given NAMESPACE. May contain multiple values separated by space. Process all branches in project's namespace if missing or empty.

## EXIT STATUS

1      Other error.

2      Invalid options or arguments.

3      Remote namespace (group) not found.

## EXAMPLES

n/a

## BUGS

TODO

## AUTHOR

George J. Pavelka <george@internetguru.io>

## SEE ALSO

`ca-evaluate`(1), `ca-distribute`(1)

[Moss](https://theory.stanford.edu/~aiken/moss/)

[Mossum: results visualization](https://github.com/hjalti/mossum)

[How to cheat in computer science](https://github.com/genchang1234/How-to-cheat-in-computer-science-101)
