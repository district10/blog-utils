# Blog Utils

[![Build Status](https://travis-ci.org/district10/blog-utils.svg?branch=master)](https://travis-ci.org/district10/blog-utils)

用于处理我的 [博客源码](https://github.com/district10/blog)。

虽然代码有点丑（我还是先把我想要的结果弄出来，Perl 的模块化我都没看……）但是功能基本有了。

## cp.pl

用于提取 markdown 文件中的链接、tag。文件 <tests/sample01.md> 经由 <cp.pl> 会生
成 <outputs/sample01.md>（去掉了标记）、<outputs/sample01.readinglist> 和
<outputs/sample01.tags>。生成的 readinglist 文件和 tags 文件会被整合成一个索引。

```bash
# cp md file, extract tags, patch anchors, etc
perl cp.pl \
        tests/sample01.md \
        outputs/sample01.readinglist \
        outputs/sample01.tags > \
        outputs/sample01.md

# cp 并不 encrypt 文件名 hash，由 merge 来处理合并时可能的冲突问题。
# cp 基本测试通过，现在到 blog 里面去实际应用。
```

**cp.pl**

- sample input: [sample01.md](https://raw.githubusercontent.com/district10/blog-utils/master/tests/sample01.md)
- sample output:
    + [sample01.md](https://github.com/district10/blog-utils/tree/master/outputs/sample01.md)
    + [sample01.readinglist](https://github.com/district10/blog-utils/tree/master/outputs/sample01.readlinglist)
    + [sample01.tags](https://github.com/district10/blog-utils/tree/master/outputs/sample01.tags)

## merge.pl

这部分还没写好。被 cat.pl 替代了。

```
# TODO: merge all md files
perl merge.pl \
    ...
```

## cat.pl

cat.pl 实现的是 include 其它 markdown 文件的功能。源码见 [cat/cat.pl](cat/cat.pl)，
效果见 [readme.txt](cat/readme.txt)。

## filter.pl

已经用在了 blog 里，见 <https://github.com/district10/blog/blob/master/filter.pl>。
filter 的目的是，使得 travis 只处理最新的 commit/push 更新了的文件，这样可以减少
生成 html 文件的时间，也可以减少七牛云盘的同步时间。

## lazyload.pl

想让网页中的图片提前处理成 lazyload 的格式，而不是在线用 jQuery 处理。
不过用正则表达式似乎有点难（很多 corner cases，你不能直接匹配字符就修改，还应该
判断文档当前的状态，比如：当前行是在 `<code>` 标签内吗？）。

## CuteWatchDog

用来监控目标文件夹下文本的变动。比进行相应的操作。源码见
[district10/CuteWatchDog: Watch dir or file for changes, and run certain commands. Written in C++ (Qt4).](https://github.com/district10/CuteWatchDog)。

---

TODO

- 好像用 Haskell 写 filter 更容易……：[removeNotes.hs](https://github.com/jgm/pandoc/blob/master/man/removeNotes.hs)
- 以后可以考虑用这重新实现这些功能，毕竟我测到的，我的 `cp.pl` 效率比 `cp` 慢好多：
    + make move  8.39s user 0.90s system 94% cpu 9.881 total
    + make move  0.26s user 0.27s system 53% cpu 0.995 total
    + [jQuery-based Local Search Engine for Hexo | HaHack](http://hahack.com/codes/local-search-engine-for-hexo/)
