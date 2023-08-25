import 'package:flutter/material.dart';

class supDashboard extends StatefulWidget {
  const supDashboard({super.key});

  @override
  State<supDashboard> createState() => _supDashboardState();
}

class _supDashboardState extends State<supDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Supervisor")
      )
    );
  }
}