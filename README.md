# Ra ebook scraper

A python scraper for [Ra](http://qntm.org/ra).

## Dependencies

Known dependencies are `requests`, `lxml`, `epubbuilder`, and `genshi`.
Install them with

```
$ make setup
```

## Running

Build `Ra.epub` file will be created in the current directory:
```
make
```

### Under the hood

```
$ ./scrape.py
```

Creates a `scrape.json` file.
This will be reused if `scrape.py` is rerun to avoid redownloading everything.

```
$ ./build.py
```

compiles the epub.

`kindlegen` or similar may be used to create a mobi file if desired.
