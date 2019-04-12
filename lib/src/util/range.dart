/// Returns a stream of range that in range [low,  high-1
Iterable<int> range(int low, int high) sync* {
  for (int i = low; i < high; ++i) {
    yield i;
  }
}
