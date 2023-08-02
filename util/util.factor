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
: solve ( str solver part -- str )
    {
        { 1 [ part1>> call( str -- str ) ] }
        { 2 [ part2>> call( str -- str ) ] }
    } case
    ;

:: split-chunks ( seq! subseq -- seq )
    V{ } clone :> res
    [ seq f = ] [
        seq subseq split1 :> ( before after )
        res before suffix! drop
        after seq!
    ] until
    res
    ;

: lines ( str -- seq ) split-lines [ empty? ] trim-tail ;
