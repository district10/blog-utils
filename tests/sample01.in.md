% title
% author
% date

The Title
=========

<#>(@read0tag1 @read0tag2)

[readed 1](https://raw.githubusercontent.com/district10/blog/master/_pages/notes.md)

:   that's my note.

    <#>(@read1tag1 @read1tag2)

    note continues.

    ```
    code: ```
    ```

    <#hooked>(@h1 @h2)

    ~~~
    code: ~~~
    ~~~

    ```c
    code: ```c
    ```

    ```python
    code: ```python
    ```

    ~~~~~~~
    code: ~~~~~~
    ~~~~~~~

    ```tzx-bigquote
    tzx-bigquote
    ```

[not readed yet](https://github.com/hadley/adv-r/)

[readed 2](http://johnmacfarlane.net/pandoc/)

:   note

    note and note and note
    and note... on and on

    ~~~{.python}
    code: ~~~{.python}
    ~~~

    ~~~ {.python}
    code: ~~~ {.python}
    ~~~

    ~~~ {#id1}
    code: ~~~ {#id1}
    ~~~

    ~~~ {.python #id2}
    code: ~~~ {.python #id2}
    ~~~

    ~~~ {#id3 .python}
    code: ~~~ {#id3 .python}
    ~~~

    <!--
    ~~~ {.python #id4 otherwords}
    code: ~~~ {.python #id4, otherwords}
    ~~~

    ~~~ {.python otherwords}
    code: ~~~ {.python otherwords}
    ~~~

    ~~~ {.python other words}
    code: ~~~ {.python other words}
    ~~~

    ~~~~~ {.python other words}
    code: ~~~ {.python other words}
    ~~~~~~~~~~~~~~~
    -->

    ~~~~ {#mycode .haskell .numberLines startFrom="100"}
    qsort []     = []
    qsort (x:xs) = qsort (filter (< x) xs) ++ [x] ++
                   qsort (filter (>= x) xs)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

misc note

misc note2

[readed 3](https://github.com/district10/extract-out-a-reading-list/blob/master/.gitignore)

:   notes

    <#>(@tag1 @tag2 @tag-3 @ta-g-4)

    note more

<#>(@read0tag1 @read0tag2)

<!--
~~~~~~~~~~~~~~~~~~tzx-bigquote
```nested
code here
```
~~~~~~~~~~~~~~~~~~
-->
