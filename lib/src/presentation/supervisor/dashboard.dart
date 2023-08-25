import 'package:flutter/material.dart';

class supDashboard extends StatefulWidget {
  final Map<String, dynamic> profile;
  const supDashboard({super.key, required this.profile});

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