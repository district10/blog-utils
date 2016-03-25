DIR_TESTS    = tests
DIR_OUTPUTS  = outputs

LIST_IN_MD   = $(wildcard $(DIR_TESTS)/*.in.md)
IN_MD        = $(LIST_IN_MD:$(DIR_TESTS)/%=%)

OUT_READLIST = $(IN_MD:%.in.md=%.out.readinglist)
OUT_TAGS     = $(IN_MD:%.in.md=%.out.tags)
OUT_MD       = $(IN_MD:%.in.md=%.out.md)
HTML_READLIST = $(OUT_READLIST:%.readinglist=%.readinglist.html)
HTML_TAGS     = $(OUT_TAGS:%.tags=%.tags.html)
HTML_MD       = $(OUT_MD:%.md=%.md.html)

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

$(DIR_OUTPUTS)/%.out.readinglist $(DIR_OUTPUTS)/%.out.tags $(DIR_OUTPUTS)/%.out.md: $(DIR_TESTS)/%.in.md
	perl cp.pl \
		$< \
		$(<:$(DIR_TESTS)/%.in.md=$(DIR_OUTPUTS)/%.out.readinglist) \
		$(<:$(DIR_TESTS)/%.in.md=$(DIR_OUTPUTS)/%.out.tags) > \
		$(<:$(DIR_TESTS)/%.in.md=$(DIR_OUTPUTS)/%.out.md)

%.html: %
	pandoc \
		$(PANDOC_OPTIONS) \
		$< -o $@

gh:
	git add -A; git commit -m "`date` - `uname`"; git push
m:
	$(EDITOR) Makefile
readme:	
	$(EDITOR) README.md

clean:
	rm $(DIR_OUTPUTS)/*
