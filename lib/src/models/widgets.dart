import 'package:flutter/material.dart';
import 'package:masters_pms/src/models/db_controllers.dart';
import 'package:masters_pms/src/models/models.dart';
import 'package:masters_pms/src/presentation/student/submission.dart';

Color getColor(String status) {
  if (status == 'current')
    return Colors.yellow;
  else if (status == 'approved')
    return Colors.green;
  else if (status == 'not_yet')
    return Colors.red;
  else
    return Colors.grey;
}

class taskCard extends StatelessWidget {
  final Task task;
  const taskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(25), topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
              margin: EdgeInsets.all(0),
              color: getColor(task.status),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
              ),
              child: Container(
                height: 100,
                width: 10,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                  )
                  ),
                Divider(
                  color: Colors.black,
                  thickness: 200,
                ),
                Text("Due: ${task.due_date}"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class feedCard extends StatelessWidget {
  final Feed feed;
  const feedCard({super.key, required this.feed});

  @override
  Widget build(BuildContext context) {
    Supervisor _super = AuthService.getSup(feed.supervisor);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 236, 236, 236),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feed.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17
                  ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${_super.first_name} ${_super.last_name}",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      )
                      ),
                    Text(
                      feed.timestamp,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      )),
                  ],
                ),
                Divider(thickness: 0.5, color: Colors.black),
                Text(feed.content),
              ],
            ),
          )
        ),
        SizedBox(height: 10)
      ],
    );
  }
}

class subCard extends StatelessWidget {
  final Document doc;
  const subCard({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doc.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18
                  ),
                  ),
                  SizedBox(height: 8.0),
                Text(
                  doc.submission_date,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  ),
                Divider(thickness: 1, color: Colors.grey),
                TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => submission(doc: doc))), 
                  child: Text(
                    "View full content",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                    ))
              ],
            ),
          )
        ),
        SizedBox(height: 10)
      ],
    );
  }
}