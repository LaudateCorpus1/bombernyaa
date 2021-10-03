import 'package:bombernyaa/utils/random_number.dart';
import 'package:bombernyaa/widgets/game_board.dart';
import 'package:bombernyaa/widgets/player_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameMenu extends StatelessWidget {
  const GameMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              PlayerPoint(),
              Expanded(
                child: GameBoard(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () => _showRandomNumber(
            title: 'Random Number', middleText: generateRandomNumber()),
        child: const SizedBox(
          height: 50,
          width: 200,
          child: Center(
            child: Text("Click here!"),
          ),
        ),
      ),
    );
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
