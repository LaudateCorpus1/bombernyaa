import 'dart:math';

import 'package:bombernyaa/models/board_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  static final List<String> alphabets = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  RxInt selectedTiles = 0.obs;
  RxInt rolledNumber = 0.obs;
  RxList<int> movement = RxList<int>();
  List<String> tilesIndex = [];
  RxList<String> initBoardState = RxList<String>();
  RxString player = '1'.obs;
  RxInt lastIndex = (-1).obs;
  RxString state = ''.obs;

  @override
  void onInit() {
    _createBoardIndex();
    initBoardState.value = boardStateDummy;
    state.value = 'pickPion';
    playerState();
    super.onInit();
  }

  void changeStateBoard() {
    String playerPion = initBoardState[lastIndex.value];
    initBoardState[selectedTiles.value] = playerPion;
    if (lastIndex.value.clamp(21, 27) == lastIndex.value ||
        lastIndex.value.clamp(42, 48) == lastIndex.value) {
      initBoardState[lastIndex.value] = '7.1';
    } else if (lastIndex.value.clamp(28, 41) == lastIndex.value) {
      initBoardState[lastIndex.value] = '7.0';
    } else {
      initBoardState[lastIndex.value] = '0.0';
    }
  }

  void playerState() {
    switch (state.value) {
      case 'pickPion':
        _playerSelectableTile();
        state.value = 'roll';
        break;
      case 'roll':
        rollNumber();
        state.value = 'chooseMove';
        break;
      case 'chooseMove':
        changeStateBoard();
        state.value = 'pickPion';
        // change to other player
        if (player.value == '1') {
          player.value = '2';
        } else if (player.value == '2') {
          player.value = '1';
        }
        playerState();
        break;
      default:
    }
  }

  void rollNumber() {
    _resetState();
    lastIndex.value = selectedTiles.value;
    _generateRandomNumber();
    playerMovement(
      tilesIndex[selectedTiles.value],
      rolledNumber.value,
    );
    _showRandomNumber(
      title: 'Random Number',
      middleText: rolledNumber.value.toString(),
    );
  }

  void _playerSelectableTile() {
    _resetState();
    for (int i = 0; i < initBoardState.length; i++) {
      List<String> id = initBoardState[i].split('.');
      if (id[0] == player.value && id[1] != '0') {
        movement.add(i);
      }
    }
  }

  void _createBoardIndex() {
    List<String> temp = [];
    for (int i = 1; i <= 10; i++) {
      for (int j = 0; j <= 6; j++) {
        String index = i.toString() + " " + alphabets[j];
        temp.add(index);
      }
    }
    tilesIndex.addAll(temp);
  }

  Color boardState(int index) {
    Color colorTile;
    String state = initBoardState[index];
    switch (state) {
      case '1.0':
        colorTile = Colors.red.shade900;
        break;
      case '1.1':
        colorTile = Colors.red;
        break;
      case '1.2':
        colorTile = Colors.red;
        break;
      case '1.3':
        colorTile = Colors.red;
        break;
      case '1.4':
        colorTile = Colors.red;
        break;
      case '1.5':
        colorTile = Colors.red;
        break;
      case '2.0':
        colorTile = Colors.yellow.shade900;
        break;
      case '2.1':
        colorTile = Colors.yellow;
        break;
      case '2.2':
        colorTile = Colors.yellow;
        break;
      case '2.3':
        colorTile = Colors.yellow;
        break;
      case '2.4':
        colorTile = Colors.yellow;
        break;
      case '2.5':
        colorTile = Colors.yellow;
        break;
      case '3.0':
        colorTile = Colors.white;
        break;
      case '4.0':
        colorTile = Colors.white;
        break;
      case '5.0':
        colorTile = Colors.white;
        break;
      case '6.0':
        colorTile = Colors.white;
        break;
      case '7.0':
        colorTile = Colors.brown;
        break;
      case '7.1':
        colorTile = Colors.brown.shade700;
        break;
      case '8.0':
        colorTile = Colors.white;
        break;
      default:
        colorTile = Colors.white;
    }
    return colorTile;
  }

  void _generateRandomNumber() {
    Random random = Random();
    int rollNumber = random.nextInt(8);
    if (rollNumber == 0) {
      _generateRandomNumber();
    } else {
      rolledNumber.value = rollNumber;
    }
  }

  void playerMovement(String currentIndex, int id) {
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
        _diagonalMove(currentIndex, 1);
        break;
      case 5:
        _diagonalMove(currentIndex, 2);
        break;
      case 6:
        _diagonalMove(currentIndex, 3);
        break;
      case 7:
        _lShapeMove(currentIndex);
        break;
      default:
    }
  }

  _straightMove(String currentIndex, int jumpedTile) {
    String ab = '';
    int index = 0;
    int yIndex = 0;
    List<String> xy = currentIndex.split(' ');
    int x = int.parse(xy[0]);
    String y = xy[1];
    for (int i = 1; i <= jumpedTile; i++) {
      yIndex = alphabets.indexOf(y);
      if ((x - i) >= 1) {
        ab = (x - i).toString() + " " + y;
        index = tilesIndex.indexOf(ab);
        movement.add(index);
      }
      if ((x + i) <= 10) {
        ab = (x + i).toString() + " " + y;
        index = tilesIndex.indexOf(ab);
        movement.add(index);
      }
      if ((yIndex - i) >= 0) {
        ab = x.toString() + " " + alphabets[(yIndex - i)];
        index = tilesIndex.indexOf(ab);
        movement.add(index);
      }
      if ((yIndex + i) <= 6) {
        ab = x.toString() + " " + alphabets[(yIndex + i)];
        index = tilesIndex.indexOf(ab);
        movement.add(index);
      }
    }
  }

  _diagonalMove(String currentIndex, int jumpedTile) {
    String ab = '';
    int index = 0;
    int yIndex = 0;
    List<String> xy = currentIndex.split(' ');
    int x = int.parse(xy[0]);
    String y = xy[1];
    for (int i = 1; i <= jumpedTile; i++) {
      yIndex = alphabets.indexOf(y);
      if ((x - i) >= 1 && (yIndex - i) >= 0) {
        ab = (x - i).toString() + " " + alphabets[(yIndex - i)];
        index = tilesIndex.indexOf(ab);
        movement.add(index);
      }
      if ((x - i) >= 1 && (yIndex + i) <= 6) {
        ab = (x - i).toString() + " " + alphabets[(yIndex + i)];
        index = tilesIndex.indexOf(ab);
        movement.add(index);
      }
      if ((x + i) <= 10 && (yIndex - i) >= 0) {
        ab = (x + i).toString() + " " + alphabets[(yIndex - i)];
        index = tilesIndex.indexOf(ab);
        movement.add(index);
      }
      if ((x + i) <= 10 && (yIndex + i) <= 6) {
        ab = (x + i).toString() + " " + alphabets[(yIndex + i)];
        index = tilesIndex.indexOf(ab);
        movement.add(index);
      }
    }
  }

  void _lShapeMove(String currentIndex) {
    String ab = '';
    int index = 0;
    int yIndex = 0;
    List<String> xy = currentIndex.split(' ');
    int x = int.parse(xy[0]);
    String y = xy[1];
    yIndex = alphabets.indexOf(y);
    if ((x - 2) >= 1 && (yIndex - 1) >= 0) {
      ab = (x - 2).toString() + " " + alphabets[(yIndex - 1)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
    if ((x - 2) >= 1 && (yIndex + 1) <= 6) {
      ab = (x - 2).toString() + " " + alphabets[(yIndex + 1)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
    if ((x + 2) <= 10 && (yIndex - 1) >= 0) {
      ab = (x + 2).toString() + " " + alphabets[(yIndex - 1)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
    if ((x + 2) <= 10 && (yIndex + 1) <= 6) {
      ab = (x + 2).toString() + " " + alphabets[(yIndex + 1)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
    if ((x - 1) >= 1 && (yIndex - 2) >= 0) {
      ab = (x - 1).toString() + " " + alphabets[(yIndex - 2)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
    if ((x + 1) <= 10 && (yIndex - 2) >= 0) {
      ab = (x + 1).toString() + " " + alphabets[(yIndex - 2)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
    if ((x - 1) >= 1 && (yIndex + 2) <= 6) {
      ab = (x - 1).toString() + " " + alphabets[(yIndex + 2)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
    if ((x + 1) <= 10 && (yIndex + 2) <= 6) {
      ab = (x + 1).toString() + " " + alphabets[(yIndex + 2)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
  }

  void _resetState() {
    movement.value = [];
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
