import 'package:flutter/material.dart';
import 'package:masters_pms/src/models/models.dart';

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
