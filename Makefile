CC = clang
CFLAGS = -Wall -Wextra -std=c99 -g
LDFLAGS =

BUILD_DIR = build
SRCS = $(wildcard *.c)
OBJS = $(addprefix $(BUILD_DIR)/, $(SRCS:.c=.o))
TARGET = $(BUILD_DIR)/clox

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS) $(LDFLAGS)

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR) $(wildcard *.o)
