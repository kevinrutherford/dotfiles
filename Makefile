TOPICS    := $(shell find . -maxdepth 1 -mindepth 1 -type d -name '[a-z]*')
BINDIR    := $(HOME)/bin
LINKFILES := $(shell find . -name '*.symlink')
LINKNAMES := $(notdir $(LINKFILES:.symlink=))
LINKS     := $(addprefix $(HOME)/., $(LINKNAMES))

VPATH = $(TOPICS)

.PHONY: dotfiles tools

dotfiles: $(BINDIR) $(LINKS)

$(BINDIR):
	ln -s $(BINDIR) `pwd`/bin

$(HOME)/.%: %.symlink
	ln -s $< $@

tools:
	sudo apt update
	$(MAKE) -C ruby
	$(MAKE) -C vim

