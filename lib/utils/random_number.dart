import 'dart:math';

String generateRandomNumber() {
  Random random = Random();
  String rollNumber = random.nextInt(8).toString();
  return rollNumber;
}
