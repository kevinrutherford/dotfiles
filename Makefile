SYMLINK   := ln -f -s

TOPICS    := $(shell find . -maxdepth 1 -mindepth 1 -type d -name '[a-z]*')
BINDIR    := $(HOME)/bin
LINKFILES := $(shell find . -name '*.symlink')
LINKNAMES := $(notdir $(LINKFILES:.symlink=))
LINKS     := $(addprefix $(HOME)/., $(LINKNAMES))

VPATH = $(TOPICS)

.PHONY: dotfiles apt tools $(TOPICS)

dotfiles: $(BINDIR) $(LINKS)
	$(MAKE) -C vim dotfiles

$(BINDIR):
	$(SYMLINK) `pwd`/bin $@

$(HOME)/.%: %.symlink
	$(SYMLINK) `pwd`/$< $@

tools: apt ruby vim tmux

ruby:
	$(MAKE) -C ruby tools

vim:
	$(MAKE) -C vim tools

tmux: ruby
	$(MAKE) -C tmux tools

apt:
	sudo apt update

