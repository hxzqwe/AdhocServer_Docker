CC = gcc
CFLAGS = -fpack-struct -I.
OBJ = main.c user.c status.c
TARGET = AdhocServer

LIBS = -lsqlite3

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

$(TARGET): $(OBJ)
	$(CC) -o $@ $^ $(LIBS) $(CFLAGS)

clean:
#	rm -rf $(TARGET) *.o *~
	rm -rf *.o *~
