# Makefile for mined

CFLAGS	= -O -w -DUNIX -D_POSIX_SOURCE
LDFLAGS   = -lncurses

OBJ = mined1.o mined2.o

all:	mined

mined:	$(OBJ)
	$(CC) -o $@ $(OBJ) $(LDFLAGS)
#	install -S 64k $@

install:	/usr/bin/mined

/usr/bin/mined:	mined
	install -cs -o bin mined $@

$(OBJ):	mined.h

clean:
	rm -f mined *.o *.s core *.bak
