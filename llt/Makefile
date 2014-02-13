CC = emcc
#CC = clang

SRCS = bitvector.c hashing.c socket.c timefuncs.c ptrhash.c utf8.c ios.c \
	dirpath.c htable.c bitvector-ops.c int2str.c dump.c random.c \
	lltinit.c
OBJS = $(SRCS:%.c=%.o)
TARGET = libllt.so
LIBS =

FLAGS = -Wall -Wno-strict-aliasing $(CFLAGS)

CCFLAGS = -g -DDEBUG $(FLAGS)

default: release

%.o: %.c
	$(CC) $(CCFLAGS) -c $< -o $@

release: $(OBJS)
	rm -rf $(TARGET)
	$(CC) -o $(TARGET) $(OBJS) $(LIBS)
	#ar rs $(TARGET) $(OBJS)

clean:
	rm -f *.o
	rm -f *.do
	rm -f *~
	rm -f core*
	rm -f $(TARGET)
