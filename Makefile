CC = clang
CFLAGS = -Wall -Wextra -std=c99 -g
LDFLAGS =

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
TARGET = clox

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJS)
