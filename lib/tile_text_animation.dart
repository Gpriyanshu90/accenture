import 'package:flutter/material.dart';
import 'dart:math';

class TileTextAnimation extends StatefulWidget {
  const TileTextAnimation({super.key});

  @override
  State<TileTextAnimation> createState() => _TileTextAnimationState();
}

class _TileTextAnimationState extends State<TileTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  final int gridSize = 5; // 5x5 tiles

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 500,
      width: double.infinity,
      child: Center(
        child: SizedBox(
          width: 500,
          height: 500,
          child: Stack(
            children: List.generate(gridSize * gridSize, (index) {
              final row = index ~/ gridSize;
              final col = index % gridSize;

              final tileWidth = 500 / gridSize;
              final tileHeight = 500 / gridSize;

              return AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  final offsetX = sin(controller.value * pi * (row + 1)) * 20;
                  final offsetY = cos(controller.value * pi * (col + 1)) * 20;
                  final rotate = sin(controller.value * pi * (index + 1)) * 0.1;

                  return Transform.translate(
                    offset: Offset(offsetX, offsetY),
                    child: Transform.rotate(
                      angle: rotate,
                      child: ClipRect(
                        child: Align(
                          widthFactor: 1 / gridSize,
                          heightFactor: 1 / gridSize,
                          alignment: Alignment(
                            -1.0 + col * (2 / (gridSize - 1)),
                            -1.0 + row * (2 / (gridSize - 1)),
                          ),
                          child: SizedBox(
                            width: 500,
                            height: 500,
                            child: const FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "CHANGE",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 200,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
