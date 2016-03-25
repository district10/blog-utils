# Blog Utils

[![Build Status](https://travis-ci.org/district10/blog-utils.svg?branch=master)](https://travis-ci.org/district10/blog-utils)

用于处理我的 [博客源码](https://github.com/district10/blog)。

虽然代码有点丑（我还是先把我想要的结果弄出来，Perl 的模块化我都没看……）但是功能基本有了。

```bash
# cp md file, extract tags, patch anchors, etc
perl cp.pl \
        tests/sample01.md \
        outputs/sample01.readinglist \
        outputs/sample01.tags > \
        outputs/sample01.md

# TODO: merge all md files
perl merge.pl \
    ...
```

- sample input: [sample01.md](https://raw.githubusercontent.com/district10/blog-utils/master/tests/sample01.md)
- sample output:
    + [sample01.md](https://github.com/district10/blog-utils/tree/master/outputs/sample01.out.md)
    + [sample01.readinglist](https://github.com/district10/blog-utils/tree/master/outputs/sample01.readlinglist)
    + [sample01.tags](https://github.com/district10/blog-utils/tree/master/outputs/sample01.tags)
