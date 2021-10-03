import 'package:bombernyaa/widgets/tile.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 7,
      children: List.generate(
        70,
        (index) => Tile(index: index),
      ),
    );
  }
}
