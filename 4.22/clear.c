#include <stdio.h>

int main() {
  printf("\x1b[2J]");
  printf("\x1b[0;0f");

  return 0;
}
