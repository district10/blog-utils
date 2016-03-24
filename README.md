# extract-out-a-reading-list

Extract out a reading list.

虽然代码有点丑但是功能基本有了。

Notes

```perl
use Digest::MD5::File qw( file_md5_hex );
my $md5 = file_md5_hex( $some_file_name );
```

[Digest::MD5 - Perl interface to the MD5 Algorithm - metacpan.org](https://metacpan.org/pod/Digest::MD5)
