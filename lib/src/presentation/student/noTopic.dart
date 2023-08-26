import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class noTopic extends StatefulWidget {
  final profile;
  const noTopic({super.key, required this.profile});

  @override
  State<noTopic> createState() => _noTopicState();
}

class _noTopicState extends State<noTopic> {
  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.account_circle_outlined),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${widget.profile['first_name']} ${widget.profile['last_name']}"),
                      Text("Good morning, ${widget.profile['first_name']}"),
                    ],
                  ),
                  Icon(Icons.circle_notifications_outlined),
                ],
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  hintText: "Find tasks, topics",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Topic"),
                  InkWell(
                      onTap: null,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.green[400],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.add),
                                Text("Add"),
                              ],
                            ),
                          )))
                ],
              ),
              Transform.scale(
                  scale: 0.6,
                  child:
                      Image(image: AssetImage('assets/images/no_topic.png'))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Topic",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Add a topic by clicking the 'Add Button'"),
                ],
              ),
              Text("Today's tasks"),
              Text("${DateFormat("EEEE d'th,' MMMM").format(currentDate)}"),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25)),
                      ),
                          height: 60,
                          width: 10,
                        ),
                      Text("No tasks to display")
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
