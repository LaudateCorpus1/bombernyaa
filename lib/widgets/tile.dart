import 'package:bombernyaa/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tile extends StatefulWidget {
  final int index;
  const Tile({Key? key, required this.index}) : super(key: key);

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> with SingleTickerProviderStateMixin {
  final GameController _gameController = Get.find();
  Animation<Color?>? animation;
  AnimationController? controller;

  @override
  initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    final CurvedAnimation curve =
        CurvedAnimation(parent: controller!, curve: Curves.ease);

    animation = ColorTween(begin: Colors.black, end: Colors.red).animate(curve);

    animation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller!.forward();
      }
      setState(() {});
    });
    controller!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation!,
      builder: (context, child) {
        return InkWell(
          onTap: () {
            if (_gameController.movement.contains(widget.index)) {
              _gameController.selectedTiles.value = widget.index;
            }
          },
          child: Obx(() => Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: _gameController.boardState(widget.index),
                  border: Border.all(
                    color: _gameController.selectedTiles.value == widget.index
                        ? Colors.green
                        : _gameController.movement.contains(widget.index)
                            ? animation!.value!
                            : Colors.black,
                    width: 3,
                  ),
                ),
                child: Center(
                  child: Text(
                    _gameController.tilesIndex[widget.index],
                  ),
                ),
              )),
        );
      },
    );
  }

  @override
  dispose() {
    controller?.dispose();
    super.dispose();
  }
}
