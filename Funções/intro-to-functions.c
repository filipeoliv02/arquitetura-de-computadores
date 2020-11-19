int f(int x);

int main() {
  int i, s = 0;
  for (i = 0; i < 10; i++) {
    s += f(i);
    return 0;
  }
}

int f(int x) {
  if (x > 0)
    return x;
  else
    return -x;
}
