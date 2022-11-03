markdowns := $(shell find src -type f)
htmls := $(patsubst src/%.md, %.html, $(markdowns))

all: htmls

PANDOC=/usr/bin/pandoc
PANDOC_OPTIONS=-f markdown
PANDOC_HTML_OPTIONS=-t html5

htmls: $(htmls)
%.html: src/%.md
	$(PANDOC) -s --toc -c style.css -o $@ $<
	
clean:
	@rm -rf ./*.html;
