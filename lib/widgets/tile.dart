import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  final int index;
  const Tile({Key? key, required this.index}) : super(key: key);

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> with SingleTickerProviderStateMixin {
  Animation<Color?>? animation;
  AnimationController? controller;

  @override
  initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

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
        return Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.index != 1 ? Colors.black : animation!.value!,
              width: 3,
            ),
          ),
          child: Center(
            child: Text(
              widget.index.toString(),
            ),
          ),
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
