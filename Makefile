SYMLINK   := ln -f -s

TOPICS    := $(shell find . -maxdepth 1 -mindepth 1 -type d -name '[a-z]*')
BINDIR    := $(HOME)/bin
LINKFILES := $(shell find . -name '*.symlink')
LINKNAMES := $(notdir $(LINKFILES:.symlink=))
LINKS     := $(addprefix $(HOME)/., $(LINKNAMES))

VPATH = $(TOPICS)

.PHONY: dotfiles apt install $(TOPICS)

dotfiles: install $(BINDIR) $(LINKS)
	$(MAKE) -C vim dotfiles

$(BINDIR):
	$(SYMLINK) `pwd`/bin $@

$(HOME)/.%: %.symlink
	$(SYMLINK) `pwd`/$< $@

install: apt ruby vim tmux

$(TOPICS):
	$(MAKE) -C $@ install

tmux: ruby

apt:
	sudo apt update
	git submodule update --init --recursive

