BINDIR := $(HOME)/bin
LINKFILES := $(shell find . -name '*.symlink')
LINKNAMES := $(notdir $(LINKFILES:.symlink=))
LINKS := $(addprefix $(HOME)/., $(LINKNAMES))
VPATH = $(shell find . -maxdepth 1 -mindepth 1 -type d -name '[a-z]*')

.PHONY: links

links: $(BINDIR) $(LINKS)

$(BINDIR):
	ln -s $(BINDIR) `pwd`/bin

$(HOME)/.%: %.symlink
	echo ln -s $< $@

