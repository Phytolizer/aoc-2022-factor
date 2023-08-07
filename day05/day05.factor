! Copyright (C) 2023 Kyle Coffey.
! See https://factorcode.org/license.txt for BSD license.
USING: aoc2022.util ;
USING: accessors assocs grouping kernel math math.parser sequences
splitting strings ;
IN: aoc2022.day05

<PRIVATE

TUPLE: move count source target ;
C: <move> move

:: chop-move ( move -- seq )
    move [ source>> ] [ count>> ] bi :> ( source a )
    source length a - :> a
    source length :> b
    source a tail :> rest
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

: parse-input ( str -- crates moves )
    lines [ empty? ] split-when first2
    ;

:: collect-times ( n quot: ( -- x ) -- seq )
    n <iota> [ drop quot call ] map
    ; inline

:: parse-stacks ( crates stacks -- )
    crates <reversed> 1 tail
    [| line |
     stacks line 1 tail 4 <step> zip
     [| stack item |
      item 32 = not
      [ item stack push ]
      when
     ] assoc-each
    ] each
    ;

:: move-crates ( str moverquot: ( move -- ) -- str )
    str parse-input :> ( crates moves )
    crates last 4 group [ drop V{ } clone ] map :> stacks
    crates stacks parse-stacks

    moves
    [| line |
     line " " split
     1 tail 2 <step> [ string>number ] map first3 :> ( n source target )
     source 1 - stacks nth :> source
     target 1 - stacks nth :> target
     n source target <move> moverquot execute
    ] each
    stacks [ last ] map >string
    ; inline

: part1 ( str -- str ) \ cratemover9000 move-crates ;
: part2 ( str -- str ) \ cratemover9001 move-crates ;

: solver ( -- solver )
    [ part1 ] [ part2 ] <solver> ;

PRIVATE>

: day05 ( str part -- str ) solver solve ;
