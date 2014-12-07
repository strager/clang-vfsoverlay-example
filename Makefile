CC ?= clang

a.out: src/main.c include/MyHeader.h Makefile MyProject.vfsoverlay.generated
	$(CC) -o $@ -ivfsoverlay MyProject.vfsoverlay.generated -I. $<

MyProject.vfsoverlay.generated: MyProject.vfsoverlay
	sed -e "s#@PWD@#$$PWD#" < $< > $@
