# Blog Utils

用于处理我的 [博客源码](https://github.com/district10/blog)。

虽然代码有点丑（我还是先把我想要的结果弄出来，Perl 的模块化我都没看……）但是功能基本有了。

```bash
# cp md file, extract tags, patch anchors, etc
perl cp.pl \
        tests/sample01.in.md \
        outputs/sample01.out.readinglist \
        outputs/sample01.out.tags > \
        outputs/sample01.out.md

# TODO: merge all md files
perl merge.pl \
    ...
```

- sample input: [sample01.in.md](https://raw.githubusercontent.com/district10/blog-utils/master/tests/sample01.in.md)
- sample output:
    + [sample01.out.md](https://github.com/district10/blog-utils/tree/master/outputs/sample01.out.md)
    + [sample01.out.readinglist](https://github.com/district10/blog-utils/tree/master/outputs/sample01.out.readlinglist)
    + [sample01.out.tags](https://github.com/district10/blog-utils/tree/master/outmzuts/sample01.out.tags)
