CC = emcc
#CC = clang

NAME = flisp
SRCS = $(NAME).c builtins.c string.c equalhash.c table.c iostream.c
OBJS = $(SRCS:%.c=%.o)
#EXENAME = $(NAME)
EXENAME = $(NAME).js
LLTDIR = llt
LLT = $(LLTDIR)/libllt.so

FLAGS = -Wall -Wno-strict-aliasing -I$(LLTDIR) $(CFLAGS) -DUSE_COMPUTED_GOTO
LIBFILES = $(LLT)
LIBS = $(LIBFILES)
#LIBS = $(LIBFILES) -lm

CCFLAGS = -g -DDEBUG $(FLAGS)

default: release

%.o: %.c
	$(CC) $(CCFLAGS) -c $< -o $@

flisp.o:  flisp.c cvalues.c operators.c types.c flisp.h print.c read.c equal.c
flmain.o: flmain.c flisp.h

$(LLT):
	cd $(LLTDIR) && make

release: $(OBJS) $(LIBFILES) flmain.o
	$(CC) $(CCFLAGS) $(OBJS) flmain.o -o $(EXENAME) $(LIBS) --embed-file flisp.boot

clean:
	rm -f *.o
	rm -f *.do
	rm -f $(EXENAME)
