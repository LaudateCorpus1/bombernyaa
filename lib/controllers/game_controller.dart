import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  static final List<String> alphabets = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  RxInt selectedTiles = 0.obs;
  RxInt rolledNumber = 0.obs;
  RxList<int> movement = RxList<int>();
  List<String> tilesIndex = [];

  @override
  void onInit() {
    _createBoardIndex();
    super.onInit();
  }

  void rollNumber() {
    _generateRandomNumber();
    playerNextMove(tilesIndex[selectedTiles.value], 1);
    _showRandomNumber(
      title: 'Random Number',
      middleText: rolledNumber.value.toString(),
    );
  }

  void _createBoardIndex() {
    List<String> temp = [];
    for (int i = 1; i <= 10; i++) {
      for (int j = 0; j <= 6; j++) {
        String index = i.toString() + alphabets[j];
        temp.add(index);
      }
    }
    tilesIndex.addAll(temp);
  }

  void _generateRandomNumber() {
    Random random = Random();
    int rollNumber = random.nextInt(8);
    rolledNumber.value = rollNumber;
  }

  void playerNextMove(String currentIndex, int id) {
    switch (id) {
      case 1:
        _straightMove(currentIndex, 1);
        break;
        case 2:
        _straightMove(currentIndex, 2);
        break;
        case 3:
        _straightMove(currentIndex, 3);
        break;
        case 4:
        _straightMove(currentIndex, 1);
        break;
        case 5:
        _straightMove(currentIndex, 1);
        break;
        case 6:
        _straightMove(currentIndex, 1);
        break;
        case 7:
        _straightMove(currentIndex, 1);
        break;
      default:
    }
  }

  _straightMove(String currentIndex, int jumpedTile) {
    String ab = '';
    int index = 0;
    int yIndex = 0;
    List<String> xy = currentIndex.split('');
    int x = int.parse(xy[0]);
    String y = xy[1];
    for (int i = 1; i <= jumpedTile; i++) {
      yIndex = alphabets.indexOf(y);
      if ((x - i) >= 1) {
        ab = (x - i).toString() + y;
        index = tilesIndex.indexOf(ab);
        movement.add(index);
      }
      if ((x + i) <= 10) {
        ab = (x + i).toString() + y;
        index = tilesIndex.indexOf(ab);
        movement.add(index);
      }
      if ((yIndex - i) >= 0) {
        ab = x.toString() + alphabets[(yIndex - i)];
        index = tilesIndex.indexOf(ab);
        movement.add(index);
      }
      if ((yIndex + i) <= 6) {
        ab = x.toString() + alphabets[(yIndex + i)];
        index = tilesIndex.indexOf(ab);
        movement.add(index);
      }
    }
  }

  void _showRandomNumber({required String title, required String middleText}) {
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
