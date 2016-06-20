perl cat.pl a.txt
-----------------

Summary:

a <- b,c
b <- d
c <- e
d <- c

so that,

    a <- (b (<- d (<- c(<-e))))
        \_ (c (<- e))

this is file a.txt,
and a.txt want to
include file: b.txt, c.txt

|   ------------------
1-------------------ab
|   this is file b.txt,
|   it was included by a.txt.
|
|   it also want's to include
|   d.txt, prefix each line with: "++++"
|
|   ++++------------------
|   3-------------------bd
|   ++++this is file d.txt,
|   ++++it includes c.txt.
|   ++++most simple include.
|   ++++
|   ++++5-------------------dc
|   ++++c.txt include e.txt
|   ++++
|   ++++no prefix, but with
|   ++++8 spaces as padding.
|   ++++
|   ++++12345678|-------------
|   ++++4-------------------ce
        |   ++++this is e.
        |   ++++
        |   ++++e.txt wants to include a.txt,
        |   ++++but it won't work.
        |   ++++
        |   ++++6-------------------ea
        |   ++++6---------------------
|   ++++4---------------------
|   ++++5---------------------
|   3---------------------
1---------------------

>   ------------------
2-------------------ac
>   c.txt include e.txt
>
>   no prefix, but with
>   8 spaces as padding.
>
>   12345678|-------------
>   4-------------------ce
        >   this is e.
        >
        >   e.txt wants to include a.txt,
        >   but it won't work.
        >
        >   6-------------------ea
        >   6---------------------
>   4---------------------
2---------------------
