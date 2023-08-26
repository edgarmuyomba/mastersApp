import 'package:flutter/material.dart';
import 'package:masters_pms/src/models/db_controllers.dart';
import 'package:masters_pms/src/models/models.dart';
import 'package:masters_pms/src/models/widgets.dart';
import 'package:masters_pms/src/presentation/student/dashboard.dart';

class submissions extends StatefulWidget {
  final Task task;
  const submissions({super.key, required this.task});

  @override
  State<submissions> createState() => _submissionsState();
}

class _submissionsState extends State<submissions> {
  late List<Document> docs;

  @override
  void initState() {
    super.initState();
    docs = DocService.fetchDocs(widget.task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 232, 232, 232),
        body: Column(
          children: [
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 100, bottom: 16.0),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 37, 50, 56),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          var profile = AuthService.getStd(widget.task.student);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => stdDashboard(profile: profile)));
                        }, 
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                      Text(
                        "Submissions",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: docs.map((doc) {
                  return subCard(doc: doc);
                }).toList(),
              ),
            )
          ],
        ));
  }
}
