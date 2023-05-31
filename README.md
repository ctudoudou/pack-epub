# Pack epub

The evil Apple Books export epub as a folder rather than a file, which makes it impossible to import epub into other devices and software.

This is a tool for repackaging epub.

# Build
``` shell
# Debug
swift build

# Release
swift build -c release
```

# Usage
``` shell
# --dir-path is the path of the epub folder which is exported from Apple Books.
./pack-epub --dir-path=example.epub
```
