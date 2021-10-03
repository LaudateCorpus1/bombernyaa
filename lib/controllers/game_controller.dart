import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  RxList<int> selectedTiles = RxList<int>();
  RxInt rolledNumber = 0.obs;

  void rollNumber() {
    _generateRandomNumber();

  }

  void _generateRandomNumber() {
    Random random = Random();
    int rollNumber = random.nextInt(8);
    rolledNumber.value = rollNumber;
  }

  void showRandomNumber({required String title, required String middleText}) {
    Get.defaultDialog(
      title: title,
      middleText: middleText,
      middleTextStyle: const TextStyle(fontSize: 46),
      textConfirm: 'OK',
      confirmTextColor: Colors.black54,
      onConfirm: () => Get.back(),
    );
  }
}
