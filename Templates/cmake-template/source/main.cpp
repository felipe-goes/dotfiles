#include <iostream>
#include <fmt/core.h>

#include "modulo/teste.hpp"

int main() {
  std::cout << "teste" << std::endl;
  std::cout << print_testando() << std::endl;
  fmt::print("Hello {}!", "world");
  std::cout << std::endl;
  return 0;
}
