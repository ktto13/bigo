#include <filesystem>
#include <iostream>
#include <fstream>
#include "nlohmann/json.hpp"

int main(int argc, char* argv[]) {
  if(argc < 2) {
    std::cout << "Use: bigo <algorithm_name>" << std::endl;
    return 1;
  }

  std::filesystem::path jsonPath = "/usr/local/share/bigo/algorithms.json";

  std::ifstream file(jsonPath);
  if(!file) {
    std::cerr << "Could not open " << jsonPath << std::endl;
    return 1;
  }

  nlohmann::json algorithms;
  file >> algorithms;

  std::string name = argv[1];

  if(algorithms.contains(name)) {
    auto data = algorithms[name];
    std::cout << "Algorithm: " << name << "\n";
    std::cout << "Best Case: " << data.value("best_case", "N/A") << "\n";
    std::cout << "Average Case: " << data.value("average_case", "N/A") << "\n";
    std::cout << "Worst Case: " << data.value("worst_case", "N/A") << "\n";
    std::cout << "Space: " << data.value("space", "N/A") << "\n";
  } else {
    std::cout << "Algorithm not found" << std::endl;
  }
}
