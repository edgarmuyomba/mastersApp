import 'package:flutter/material.dart';
import 'package:masters_pms/src/models/db_controllers.dart';
import 'package:masters_pms/src/models/models.dart';
import 'package:intl/intl.dart';

class stdDashboard extends StatefulWidget {
  final Map<String, dynamic> profile;
  const stdDashboard({super.key, required this.profile});

  @override
  State<stdDashboard> createState() => _stdDashboardState();
}

class _stdDashboardState extends State<stdDashboard> {
  late Topic _topic;

  @override
  void initState() {
    super.initState();
    _topic = TopicService.fetchTopic(widget.profile['topic']);
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Card(
          margin: EdgeInsets.all(0),
          color: Color.fromARGB(255, 37, 50, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70),
                  Row(
                    // top icons
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon:
                              Icon(Icons.arrow_back_ios, color: Colors.white)),
                      Row(
                        children: [
                          Icon(Icons.camera_alt_outlined, color: Colors.white),
                          SizedBox(width: 16),
                          Icon(Icons.calendar_today, color: Colors.white),
                          SizedBox(width: 16),
                          Icon(Icons.edit, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    _topic.title,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "${_topic.stage} Stage",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 23,
                        color: Colors.white),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Progress",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "${_topic.completion}%",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  LinearProgressIndicator(
                      value: _topic.completion / 100,
                      semanticsLabel: 'Thesis Percentage Completion'),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 35),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Masters Journey",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("${DateFormat("EEEE d'th,' MMMM").format(currentDate)}"),
        )
      ]),
    );
  }
}
