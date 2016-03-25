% 标题
% 作者
% 日期

还是标题
========

下面是两个 tag（用于生成列表，索引）：还没有 anchor，所以会自动生成一个。

<#>(@read0tag1 @read0tag2)

原文里是：

```
<#>(@read0tag1 @read0tag2)
```

[阅读 1](https://raw.githubusercontent.com/district10/blog/master/_pages/notes.md) [^脚注]

:   这是笔记。下面有两个 tag。

    <#>(@read1tag1 @read1tag2)

    这两个 tag 会被 anchor 到「阅读 1」。

    `@`{.tzx-anchor #hello}

    欢迎回来。但是你看不到（#hello），只是用来 anchoring。

    note continues.

    ```
    code: ```
    ```

    源码都会被整理为 `~~~` 格式。并自动生成 id，用于索引。

    ~~~
    code: ~~~
    ~~~

    这里是两个 tag，anchor 到生成精确的当前位置（#hooked）。

    <#hooked>(@h1 @h2)


    ```c
    指定语言的代码：```c
    ```

    ~~~~~~~
    用 tilde 符号：~~~~~~
    ~~~~~~~

    ```tzx-bigquote
    用自己的 class 也是可以的。
    ```

[^脚注]: 脚注是不错的。

[阅读 2](https://github.com/hadley/adv-r/)

[这个不是阅读]

[这个不是阅读]: http://dvorak4tzx.com

[这个是阅读，并有笔记](http://johnmacfarlane.net/pandoc/)

:   note

    note and note and note
    and note... on and on

    ~~~{.python}
    没有整理好的代码：code: ~~~{.python}
    ~~~

    ~~~ {.python}
    整理好的代码：code: ~~~ {.python}
    ~~~

    ~~~ {#id1}
    有 id 的代码：code: ~~~ {#id1}
    ~~~

    ~~~ {.python #id2}
    有 id 和类型的代码：code: ~~~ {.python #id2}
    ~~~

    ~~~ {#id3 .python}
    有 id 和类型的代码：code: ~~~ {#id3 .python}
    ~~~

    注释掉的内容不会显示。
    <!--
    你看不到我。
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

    更多 options 用来配置代码：

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

现在回到 [hello](#hello)

![][standalone-pic-big-one]

[inline-pic-without-showing-this-text]: http://gnat-tang-shared-image.qiniudn.com/emoji/11.gif
[standalone-pic-small-one]: http://gnat.qiniudn.com/dexter.jpg
[standalone-pic-big-one]: http://gnat.qiniudn.com/jodie-foster-math.png "本来想用 Gatsby 挥拳打 Tom 的图片"
