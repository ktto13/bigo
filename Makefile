TARGET = bigo
BUILD_DIR = build


BIN_DIR = /usr/local/bin
SHARE_DIR = /usr/local/share/bigo

# Default target
all: build

# Build project
build: $(BUILD_DIR)/$(TARGET)

$(BUILD_DIR)/$(TARGET):
	@echo "Creating build directory if it doesn't exist..."
	mkdir -p $(BUILD_DIR)
	@echo "Running CMake..."
	cd $(BUILD_DIR) && cmake ..
	@echo "Building project..."
	cd $(BUILD_DIR) && make

# Install symlink
install: all
	sudo ln -sf $(PWD)/$(BUILD_DIR)/$(TARGET) $(BIN_DIR)/$(TARGET)
	sudo mkdir -p $(SHARE_DIR)
	sudo cp data/algorithms.json $(SHARE_DIR)/algorithms.json

#Uninstall symlink
uninstall:
	sudo rm -f /usr/local/bin/bigo
	sudo rm -rf /usr/local/share/bigo

# Clean build artifacts
clean: uninstall
	@echo "Cleaning build directory..."
	rm -rf $(BUILD_DIR)

.PHONY: all build install clean
