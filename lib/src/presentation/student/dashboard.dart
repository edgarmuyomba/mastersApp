import 'package:flutter/material.dart';

class stdDashboard extends StatefulWidget {
  const stdDashboard({super.key});

  @override
  State<stdDashboard> createState() => _stdDashboardState();
}

class _stdDashboardState extends State<stdDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Student")
      )
    );
  }
}