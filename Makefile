.PHONY: setup

all: Ra.epub

setup:
	sudo apt-get install libxslt1-dev || true # OK to fail, unless you're on Ubuntu Linux
	test -d venv || virtualenv venv
	source venv/bin/activate && pip install  -r requirements.txt

scrape.json:
	source venv/bin/activate && ./scrape.py

Ra.epub: scrape.json
	source venv/bin/activate && ./build.py
