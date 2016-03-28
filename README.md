# Blog Utils

[![Build Status](https://travis-ci.org/district10/blog-utils.svg?branch=master)](https://travis-ci.org/district10/blog-utils)

「Koan | 吐槽」

发现自己在重复造轮子，而且造得不好！Pandoc 有 `--filter` 和 `--file-scope` 的概念，
正好对应我的 `filter.pl` 和 `merger.pl`，我……只能说英雄所见略同了……
这些 Perl 脚本还能用，但计划以后用 Pandoc 的 filter。

「Refs | 参考文档」

  - [Pandoc - Scripting with pandoc](http://pandoc.org/scripting.html)
  - [Pandoc::Filter - process Pandoc abstract syntax tree - metacpan.org](https://metacpan.org/pod/Pandoc::Filter)
  - [jgm/pandocfilters: A python module for writing pandoc filters, with a collection of examples](https://github.com/jgm/pandocfilters)

---

用于处理我的 [博客源码](https://github.com/district10/blog)。

虽然代码有点丑（我还是先把我想要的结果弄出来，Perl 的模块化我都没看……）但是功能基本有了。

- <http://whudoc.qiniudn.com/blog/utils>

```bash
# cp md file, extract tags, patch anchors, etc
perl cp.pl \
        tests/sample01.md \
        outputs/sample01.readinglist \
        outputs/sample01.tags > \
        outputs/sample01.md

# cp 并不 encrypt 文件名 hash，由 merge 来处理合并时可能的冲突问题。
# cp 基本测试通过，现在到 blog 里面去实际应用。

# TODO: merge all md files
perl merge.pl \
    ...
```

- sample input: [sample01.md](https://raw.githubusercontent.com/district10/blog-utils/master/tests/sample01.md)
- sample output:
    + [sample01.md](https://github.com/district10/blog-utils/tree/master/outputs/sample01.md)
    + [sample01.readinglist](https://github.com/district10/blog-utils/tree/master/outputs/sample01.readlinglist)
    + [sample01.tags](https://github.com/district10/blog-utils/tree/master/outputs/sample01.tags)

TODO

- 好像用 Haskell 写 filter 更容易……：[removeNotes.hs](https://github.com/jgm/pandoc/blob/master/man/removeNotes.hs)
- 以后可以考虑用这重新实现这些功能，毕竟我测到的，我的 `cp.pl` 效率比 `cp` 慢好多：
    + make move  8.39s user 0.90s system 94% cpu 9.881 total
    + make move  0.26s user 0.27s system 53% cpu 0.995 total
    + [jQuery-based Local Search Engine for Hexo | HaHack](http://hahack.com/codes/local-search-engine-for-hexo/)
