# CA-MEASURE 1 2021-02-14 GNU "User Manuals"

## NAME

CA Measure - measure software similarities using Moss script

## SYNOPSIS

`ca measure` [`-hps`]

## DESCRIPTION

Downloads all repositories from a NAMESPACE matching given PREFIX. Together with the current project (supposedly the sample solution), measures software similarities between each other. The link with evaluation results appears at the end of the script.

## OPTIONS

`-h`, `--help`
       Display usage.

`-p`, `--prefix PREFIX`
       From given NAMESPACE (below) add only projects with matching PREFIX (empty by default).

`-s`, `--namespace NAMESPACE`
       Add projects from given NAMESPACE. May contain multiple values separated by space.

## EXIT STATUS

1      Other error.

## EXAMPLES

n/a

## BUGS

TODO

## AUTHOR

George J. Pavelka <george@internetguru.io>

## SEE ALSO

- [Moss](https://theory.stanford.edu/~aiken/moss/)
- [Mossum: results visualization](https://github.com/hjalti/mossum)
- [How to cheat in computer science](https://github.com/genchang1234/How-to-cheat-in-computer-science-101)
