import 'package:flutter/material.dart';
import 'package:inherited_widget_exam/examples/ex_1.dart';
import 'package:inherited_widget_exam/examples/ex_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FutureBuilder 예제',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InheritedWidgetExample2(),
    );
  }
}
