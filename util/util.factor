USING: accessors combinators effects kernel quotations sequences splitting stack-checker ;
IN: aoc2022.util

PREDICATE: partfunc < quotation infer ( x -- x ) effect= ;

<PRIVATE

: id ( x -- x ) ;

PRIVATE>

TUPLE: solver
    { part1 partfunc read-only initial: [ id ] }
    { part2 partfunc read-only initial: [ id ] }
    ;
C: <solver> solver
: solve ( str part solver -- str )
    swap {
        { 1 [ part1>> call( str -- str ) ] }
        { 2 [ part2>> call( str -- str ) ] }
    } case
    ;

: lines ( str -- seq ) split-lines [ empty? ] trim-tail ;
