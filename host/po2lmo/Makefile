INSTALL = install
PREFIX  = /usr/local/bin

all: po2lmo

contrib/lemon: contrib/lemon.c contrib/lempar.c
	$(CC) -o contrib/lemon $<

lib/plural_formula.c: lib/plural_formula.y contrib/lemon
	./contrib/lemon -q $<

lib/lmo.c: lib/plural_formula.c

clean:
	$(RM) -f contrib/lemon lib/*.o lib/plural_formula.c lib/plural_formula.h *.o po2lmo

po2lmo: po2lmo.o lib/lmo.o lib/plural_formula.o
	$(CC) $(LDFLAGS) -o $@ $^

install: po2lmo
	$(INSTALL) -m 755 po2lmo $(PREFIX)
