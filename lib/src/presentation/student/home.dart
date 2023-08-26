import 'package:flutter/material.dart';
import 'package:masters_pms/src/presentation/student/calendar.dart';
import 'package:masters_pms/src/presentation/student/dashboard.dart';
import 'package:masters_pms/src/presentation/student/profile.dart';

class stdHome extends StatefulWidget {
  final Map<String, dynamic> profile;
  const stdHome({super.key, required this.profile});

  @override
  State<stdHome> createState() => _stdHomeState();
}

class _stdHomeState extends State<stdHome> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [stdDashboard(profile: widget.profile), calendar(), profile(account: widget.profile)];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 232, 232),
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_sharp),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
