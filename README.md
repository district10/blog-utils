# extract-out-a-reading-list

Extract out a reading list.

虽然代码有点丑但是功能基本有了。

```bash
perl cp.pl \
        tests/sample01.in.md \
        outputs/sample01.out.readinglist \
        outputs/sample01.out.tags > \
        outputs/sample01.out.md
```

- sample input: [sample01.in.md](tests/sample01.in.md)
- sample output:
    + [sample01.out.md](tests/sample01.out.md)
    + [sample01.out.md](tests/sample01.out.readlinglist)
    + [sample01.out.md](tests/sample01.out.tags)
