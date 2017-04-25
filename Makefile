BINDIR := $(HOME)/bin

.PHONY install

install: $(BINDIR)

$(BINDIR):
	ln -s $(BINDIR) `pwd`/bin

