# In some dists (e.g. Ubuntu) bash is not the default shell. Statements like·
# # cp -a etc/rear/{mappings,templates} ...
# # assumes bash. So its better to set SHELL
# SHELL=/bin/bash

DESTDIR =
OFFICIAL =

name = latex2doc
version := $(shell awk "/^VERSION *= */ { gsub(/^VERSION[ ]*=[ ']*|[ ']*$$/,\"\"); print}" $(name))

.PHONY: install-all install uninstall clean

install-all:
	chmod a+x latex2doc
	cp latex2doc /usr/bin
	cd ./unoconv
	make install
	cd ../

install:
	chmod a+x latex2doc
	cp latex2doc /usr/bin

uninstall:
	rm /usr/bin/latex2doc

clean:
	cd ./unoconv
	make clean
	cd ../