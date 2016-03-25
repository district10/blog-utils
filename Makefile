DIR_TESTS    = tests
DIR_OUTPUTS  = outputs

LIST_IN_MD   = $(wildcard $(DIR_TESTS)/*.md)
IN_MD        = $(LIST_IN_MD:$(DIR_TESTS)/%=%)

OUT_READLIST = $(IN_MD:%.md=%.readinglist)
OUT_TAGS     = $(IN_MD:%.md=%.tags)
OUT_MD       = $(IN_MD:%.md=%.md)
HTML_READLIST = $(OUT_READLIST:%.readinglist=%.readinglist.html)
HTML_TAGS     = $(OUT_TAGS:%.tags=%.tags.html)
HTML_MD       = $(OUT_MD:%.md=%.html)

LIST_OUTS = $(OUT_READLIST) $(OUT_TAGS) $(OUT_MD)
LIST_HTMLS = $(HTML_READLIST) $(HTML_TAGS) $(HTML_MD)
OUTS = $(addprefix $(DIR_OUTPUTS)/, $(LIST_OUTS))
HTMLS = $(addprefix $(DIR_OUTPUTS)/, $(LIST_HTMLS))

PANDOC_OPTIONS = -S -s --ascii \
	-c ../main.css \
	--highlight-style pygments \
	-f markdown

all: $(OUTS) $(HTMLS)
$(HTMLS): $(OUTS)
$(OUTS): $(DIR_OUTPUTS) cp.pl Makefile
$(DIR_OUTPUTS):
	mkdir -p $@

$(DIR_OUTPUTS)/%.readinglist $(DIR_OUTPUTS)/%.tags $(DIR_OUTPUTS)/%.md: $(DIR_TESTS)/%.md
	perl cp.pl \
		$< \
		$(<:$(DIR_TESTS)/%.md=$(DIR_OUTPUTS)/%.readinglist) \
		$(<:$(DIR_TESTS)/%.md=$(DIR_OUTPUTS)/%.tags) > \
		$(<:$(DIR_TESTS)/%.md=$(DIR_OUTPUTS)/%.md)

%.html: %.md
	pandoc \
		$(PANDOC_OPTIONS) \
		$< -o $@

%.html: %
	pandoc \
		$(PANDOC_OPTIONS) \
		$< -o $@

gh:
	git add -A; git commit -m "`date` - `uname`"; git push
pull:
	git pull
push:
	git push
status:
	git status
diff:
	git diff

qiniu:
	rm -Rf publish 2&>/dev/null
	mkdir -p publish
	cp -r tests outputs publish/
	(echo '```'; tree; echo '```';) | pandoc -f markdown -s -S --ascii -o publish/index.html
	~/qrsync conf.json

m:
	$(EDITOR) Makefile
readme:	
	$(EDITOR) README.md

clean:
	rm $(DIR_OUTPUTS)/*
