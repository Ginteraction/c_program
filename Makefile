# Compiler and flags
CC = gcc
CFLAGS = -Iinclude -Wall

# Directories
SRCDIR = src
OBJDIR = obj
BINDIR = bin

# Target executable
TARGET = $(BINDIR)/hello

# Source files and object files
SRC = $(wildcard $(SRCDIR)/*.c)
OBJ = $(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

# Default rule
all: $(TARGET)

# Rule to build the target executable
$(TARGET): $(OBJ)
	mkdir -p $(BINDIR)
	$(CC) $(OBJ) -o $@

# Rule to build object files
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up
clean:
	rm -rf $(OBJDIR) $(BINDIR)

# Phony targets
.PHONY: all clean
