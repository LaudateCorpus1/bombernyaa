import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      children: List.generate(
        70,
        (index) => Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Center(
            child: Text(
              index.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
