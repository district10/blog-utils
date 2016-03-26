# Blog Utils

[![Build Status](https://travis-ci.org/district10/blog-utils.svg?branch=master)](https://travis-ci.org/district10/blog-utils)

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
