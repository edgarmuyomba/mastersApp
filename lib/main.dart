import 'package:flutter/material.dart';
import 'package:masters_pms/src/presentation/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masters Supervision',
      home: login()
    );
  }
}
