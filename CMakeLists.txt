cmake_minimum_required(VERSION 3.14)
project(bigo)

# Use C++17 standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Include FetchContent module
include(FetchContent)

# Declare nlohmann::json as a dependency
FetchContent_Declare(
  json
  GIT_REPOSITORY https://github.com/nlohmann/json.git
  GIT_TAG v3.11.2        # Pin to a stable version
)
FetchContent_MakeAvailable(json)

# Create the executable
add_executable(bigo src/main.cpp)

# Link the json library
target_link_libraries(bigo PRIVATE nlohmann_json::nlohmann_json)

# Optional: include the data folder in runtime
configure_file(data/algorithms.json data/algorithms.json COPYONLY)

#Executable
install(TARGETS bigo DESTINATION /usr/local/bin)

#JSON file
install(FILES data/algorithms.json DESTINATION /usr/local/share/bigo)
