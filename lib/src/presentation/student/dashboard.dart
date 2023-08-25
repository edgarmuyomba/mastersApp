import 'package:flutter/material.dart';

class stdDashboard extends StatefulWidget {
  final Map<String, dynamic> profile;
  const stdDashboard({super.key, required this.profile});

  @override
  State<stdDashboard> createState() => _stdDashboardState();
}

class _stdDashboardState extends State<stdDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${widget.profile['id']}")
      )
    );
  }
}