USING: kernel sequences splitting ;
IN: aoc2022.util

:: split-chunks ( seq! subseq -- seq )
    V{ } clone :> res
    [ seq f = ] [
        seq subseq split1 :> ( before after )
        res before suffix! drop
        after seq!
    ] until
    res
    ;

: lines ( str -- seq ) "\n" split harvest ;
