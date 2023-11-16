# VARIABLES
SHELL = /bin/sh
NAME = dmscripts

PREFIX ?= /usr/local
SCRIPTS := $(wildcard ./scripts/*)

install:
	echo $(DESTDIR)$(MANPREFIX)
	install -Dm 775 $(SCRIPTS) -t $(DESTDIR)$(PREFIX)/bin/

uninstall:
	rm $(addprefix $(PREFIX)/bin/,$(SCRIPTS:./scripts/%=%))

list:
	echo "Prefix $(PREFIX)"

.PHONY: install uninstall list



