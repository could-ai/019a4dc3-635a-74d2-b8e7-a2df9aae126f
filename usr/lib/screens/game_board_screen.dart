import 'package:flutter/material.dart';
import 'dart:math';

class GameBoardScreen extends StatefulWidget {
  const GameBoardScreen({super.key});

  @override
  State<GameBoardScreen> createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {
  int diceValue = 1;
  List<List<int>> board = List.generate(15, (_) => List.filled(15, 0)); // Simple grid representation
  List<Offset> playerPositions = [
    const Offset(7, 7), // Player 1 position
    const Offset(7, 7), // Player 2 position
  ];

  void rollDice() {
    setState(() {
      diceValue = Random().nextInt(6) + 1;
      // TODO: Implement piece movement logic
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Board'),
      ),
      body: Column(
        children: [
          // Dice area
          Container(
            height: 100,
            color: Colors.grey[200],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dice: $diceValue',
                    style: const TextStyle(fontSize: 24),
                  ),
                  ElevatedButton(
                    onPressed: rollDice,
                    child: const Text('Roll Dice'),
                  ),
                ],
              ),
            ),
          ),
          // Game board
          Expanded(
            child: Container(
              color: Colors.green[100],
              child: CustomPaint(
                painter: LudoBoardPainter(playerPositions),
                child: Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LudoBoardPainter extends CustomPainter {
  final List<Offset> playerPositions;

  LudoBoardPainter(this.playerPositions);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw a simple grid for the board
    double cellSize = size.width / 15;
    for (int i = 0; i <= 15; i++) {
      canvas.drawLine(Offset(i * cellSize, 0), Offset(i * cellSize, size.height), paint);
      canvas.drawLine(Offset(0, i * cellSize), Offset(size.width, i * cellSize), paint);
    }

    // Draw players
    final playerPaint = Paint()..color = Colors.red;
    for (var position in playerPositions) {
      canvas.drawCircle(Offset(position.dx * cellSize + cellSize / 2, position.dy * cellSize + cellSize / 2), 10, playerPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}