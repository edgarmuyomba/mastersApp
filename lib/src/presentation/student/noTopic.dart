import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masters_pms/src/presentation/student/createTopic.dart';

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Row(
                  children: [
                    Icon(Icons.account_circle_outlined, size: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${widget.profile['first_name']} ${widget.profile['last_name']}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17)
                              ),
                          Text("Good morning, ${widget.profile['first_name']}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13
                          ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Icon(Icons.circle_notifications_outlined, size: 50),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24
                        )
                        ),
                      InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => createTopic(profile: widget.profile))),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromARGB(255, 134, 255, 138),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.add, color: Colors.green[900]),
                                    Text("Add",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green[900]),
                                    ),
                                  ],
                                ),
                              )))
                    ],
                  ),
                ),
                Transform.scale(
                    scale: 0.5,
                    child:
                        Image(image: AssetImage('assets/images/no_topic.png'))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No Title",
                      style: TextStyle(
                        color: Color.fromARGB(255, 38, 50, 56),
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      )
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add a title by clicking the 'Add Button'",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13
                      ),
                      ),
                  ],
                ),
                SizedBox(height: 8),
                Divider(thickness: 1,),
                SizedBox(height: 8),
                Text(
                  "Today's tasks",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22
                    ),
                  ),
                Text("${DateFormat("EEEE d'th,' MMMM").format(currentDate)}",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13
                ),
                ),
                SizedBox(height: 24),
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 243, 243),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("No tasks to display"),
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
