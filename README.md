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

Just one last inconvenience, maybe a bug in a library used. Go to `epubbuilder.py` in your venv, and add 
`.encode('utf8')` to `stream.render('xml')` in `__write_toc_ncx()`, like this:

```
    def __write_toc_ncx(self, zip_outout):
        """
        Add the table of contents navigation control xml to the zip
        """
        self.toc_map_root.assign_play_order()
        tmpl = self.loader.load('toc.ncx')
        stream = tmpl.generate(book = self)
        zip_outout.writestr(os.path.join('OEBPS', 'toc.ncx'), 
            stream.render('xml').encode('utf8'), compress_type = zipfile.ZIP_DEFLATED)
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
