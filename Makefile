SYMLINK   := ln -f -s

TOPICS    := $(shell find . -maxdepth 1 -mindepth 1 -type d -name '[a-z]*')
BINDIR    := $(HOME)/bin
LINKFILES := $(shell find . -name '*.symlink')
LINKNAMES := $(notdir $(LINKFILES:.symlink=))
LINKS     := $(addprefix $(HOME)/., $(LINKNAMES))

VPATH = $(TOPICS)

.PHONY: dotfiles preinstall $(TOPICS) postinstall

dotfiles: preinstall $(BINDIR) $(LINKS) postinstall

$(BINDIR):
	$(SYMLINK) `pwd`/bin $@

$(HOME)/.%: %.symlink
	$(SYMLINK) `pwd`/$< $@

preinstall:
	sudo apt update
	git submodule update --init --recursive

postinstall: vim ruby tmux

$(TOPICS):
	$(MAKE) -C $@ postinstall

tmux: ruby

