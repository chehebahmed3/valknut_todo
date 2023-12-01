import 'package:flutter/material.dart';
import 'package:valknut_todo/features/Todo/presentation/pages/todo_sreen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const TodoScreen(),
    );
  }
}
