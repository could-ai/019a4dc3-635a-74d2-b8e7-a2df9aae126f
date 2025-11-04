import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/lobby_screen.dart';
import 'screens/game_board_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'King Ludo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/lobby': (context) => const LobbyScreen(),
        '/game': (context) => const GameBoardScreen(),
      },
    );
  }
}