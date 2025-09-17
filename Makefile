TARGET = bigo

# Build directory
BUILD_DIR = build

# Default target
all: $(BUILD_DIR)/$(TARGET)

# Rule to build the executable
$(BUILD_DIR)/$(TARGET):
	@echo "Creating build directory if it doesn't exist..."
	mkdir -p $(BUILD_DIR)
	@echo "Running CMake..."
	cd $(BUILD_DIR) && cmake ..
	@echo "Building project..."
	cd $(BUILD_DIR) && make

# Clean build artifacts
clean:
	@echo "Cleaning build directory..."
	rm -rf $(BUILD_DIR)

.PHONY: all clean

