import 'dart:math';

int get_id() {
  Random random = new Random();
  return random.nextInt(999999) + 100000;
}