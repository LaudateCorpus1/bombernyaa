import 'package:bombernyaa/controllers/game_controller.dart';
import 'package:bombernyaa/widgets/game_board.dart';
import 'package:bombernyaa/widgets/player_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameMenu extends StatelessWidget {
  final GameController _gameController = Get.find();
  GameMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            PlayerPoint(),
            GameBoard(),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () => _gameController.rollNumber(),
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
}
