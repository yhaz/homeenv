go build --buildmode=c-archive foo.go
gcc -pthread bar.c foo.a -o bar
