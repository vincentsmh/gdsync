
This project helps you to easily update a file to Google drive. It help you to
find the old file on Google drive with the same "file name" and replace it. If
there are more than one file on Google drive with the same name, it will ask
you which file path you want to replace. It takes no operations if there is
not an existed file name on Google drive.

Dependent project
=================

https://github.com/prasmussen/gdrive

Installation
============

Execute `install.sh` directly. It will install file to system under
`/usr/local/bin`. Thus you will be asked password for permissions. Then you
need to follow the URL to get the verification code from Google. After you
finish it, this tool will do a simple `list` for testing.

```bash
$ ./install.sh

...
...

Go to the following url in your browser:
https://accounts.google.com/o/oauth2/auth?access_type=offline&client_id=.........

Enter verification code: xxxxxxxxxxxxx
Id                Name        Type   Size       Created
xxxxxxxxxxx   yyyyyyyyyyyyy   bin    5.1 MB     2017-09-19 02:08:04
xxxxxxxxxxx   yyyyyyyyyyyyy   doc               2017-09-15 02:32:53
xxxxxxxxxxx   yyyyyyyyyyyyy   bin    1.4 MB     2017-09-18 13:01:18
xxxxxxxxxxx   yyyyyyyyyyyyy   doc               2017-09-18 08:12:39
xxxxxxxxxxx   yyyyyyyyyyyyy   bin    830.2 KB   2017-09-14 02:07:04
xxxxxxxxxxx   yyyyyyyyyyyyy   doc               2017-03-01 07:16:45
xxxxxxxxxxx   yyyyyyyyyyyyy   doc               2017-09-15 02:32:02
xxxxxxxxxxx   yyyyyyyyyyyyy   bin    880.0 B    2017-09-15 02:14:29
xxxxxxxxxxx   yyyyyyyyyyyyy   bin    1.3 MB     2017-09-15 02:14:05
xxxxxxxxxxx   yyyyyyyyyyyyy   bin    32.6 KB    2017-09-15 02:14:02

```

How to use
==========

```bash
$ gdsync FILE_PATH
```
