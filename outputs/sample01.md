% 标题
% 作者
% 日期

还是标题
========

下面是两个 tag（用于生成列表，索引）：还没有 anchor，所以会自动生成一个。

`@`{.tzx-anchor #ZX1d8cd98f00b204e9800998ecf8427TZX1de28d1e770e4c5f4ed0ac371e965T}

原文里是：

~~~ {#auto-listing-1}
<#>(@read0tag1 @read0tag2)
~~~

[阅读 1](https://raw.githubusercontent.com/district10/blog/master/_pages/notes.md) [^脚注] `@`{.tzx-anchor #ZX500b50b3d297d7fdd2aa90fbac4a5T}

:   这是笔记。下面有两个 tag。

    这两个 tag 会被 anchor 到「阅读 1」。

    `@`{.tzx-anchor #ZX1d8cd98f00b204e9800998ecf8427Thello}

    欢迎回来。但是你看不到（#hello），只是用来 anchoring。

    note continues.

    ~~~ {#auto-listing-2}
    code: ```
    ~~~

    源码都会被整理为 `~~~` 格式。并自动生成 id，用于索引。

    ~~~ {#auto-listing-3}
    code: ~~~
    ~~~

    这里是两个 tag，anchor 到生成精确的当前位置（#hooked）。

    `@`{.tzx-anchor #ZX1d8cd98f00b204e9800998ecf8427Thooked}


    ~~~ {#auto-listing-4}
    指定语言的代码：```c
    ~~~

    ~~~ {#auto-listing-5}
    用 tilde 符号：~~~~~~
    ~~~

    ~~~ {#auto-listing-6}
    用自己的 class 也是可以的。
    ~~~

[^脚注]: 脚注是不错的。

[阅读 2](https://github.com/hadley/adv-r/) `@`{.tzx-anchor #ZXfe45293b32db161408454be928b45T}

[这个不是阅读]

[这个不是阅读]: http://dvorak4tzx.com

[这个是阅读，并有笔记](http://johnmacfarlane.net/pandoc/) `@`{.tzx-anchor #ZX4adf233335c9d259d8caee6f388fcT}

:   note

    note and note and note
    and note... on and on

    ~~~ {#auto-listing-7 .python}
    没有整理好的代码：code: ~~~{.python}
    ~~~

    ~~~ {#auto-listing-8 .python}
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
    更多 options 用来配置代码：

    ~~~ {#mycode .haskell .numberLines startFrom="100"}
    qsort []     = []
    qsort (x:xs) = qsort (filter (< x) xs) ++ [x] ++
                   qsort (filter (>= x) xs)
    ~~~

---

misc note

misc note2

[readed 3](https://github.com/district10/extract-out-a-reading-list/blob/master/.gitignore) `@`{.tzx-anchor #ZXf7a7f8af4bd76623b7b8ebc8130adT}

:   notes

    note more

现在回到 [hello](#ZX1d8cd98f00b204e9800998ecf8427Thello)

![][standalone-pic-big-one]

[inline-pic-without-showing-this-text]: http://gnat-tang-shared-image.qiniudn.com/emoji/11.gif
[standalone-pic-small-one]: http://gnat.qiniudn.com/dexter.jpg
[standalone-pic-big-one]: http://gnat.qiniudn.com/jodie-foster-math.png "本来想用 Gatsby 挥拳打 Tom 的图片"
