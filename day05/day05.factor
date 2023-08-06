! Copyright (C) 2023 Kyle Coffey.
! See https://factorcode.org/license.txt for BSD license.
USING: aoc2022.util ;
USING: accessors assocs kernel math math.parser sequences splitting ;
USE: stack-checker
IN: aoc2022.day05

<PRIVATE

TUPLE: move count source target ;
C: <move> move

:: chop-move ( move -- seq )
    move dup source>> count>> :> ( source a )
    source length :> b
    source a head* :> rest
    a b source delete-slice
    source move source<<
    rest
    ;

:: cratemover9000 ( move -- )
    move chop-move :> chopped
    move target>> chopped reverse append! drop
    ;

:: cratemover9001 ( move -- )
    move chop-move :> chopped
    move target>> chopped append! drop
    ;

:: move-crates ( str moverquot: ( move -- ) -- str )
    str lines [ empty? ] split-when first2 :> ( crates moves )
    crates :> crates
    crates last length 4 /i
    <iota> [ drop V{ } ] map :> stacks

    crates <reversed> 1 tail
    [| line |
     stacks line 1 tail 4 <step> zip
     [| stack item |
      item " " equal?
      [ stack item suffix! drop ]
      when
     ] assoc-each
    ] each

    moves
    [| line |
     line " " split
     2 <step> [ string>number ] map first3
     <move> moverquot execute
    ] each
    stacks [ last ] map "" join
    ; inline

: part1 ( str -- str ) \ cratemover9000 move-crates ;
: part2 ( str -- str ) \ cratemover9001 move-crates ;

: solver ( -- solver )
    [ part1 ] [ part2 ] <solver> ;

PRIVATE>

: day05 ( str part -- str ) solver solve ;
