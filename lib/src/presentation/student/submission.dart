import 'package:flutter/material.dart';
import 'package:masters_pms/src/models/models.dart';

class submission extends StatefulWidget {
  final Document doc;
  const submission({super.key, required this.doc});

  @override
  State<submission> createState() => _submissionState();
}

class _submissionState extends State<submission> {
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
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    Text(
                      "${widget.doc.title.substring(0, 13)}",
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
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Sent to:",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Mr. Kato Opom",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Email:",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "katoopom@gmail.com",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Sent to:",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "${widget.doc.submission_date}",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Content",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                          style: TextStyle(height: 1.5)),
                      SizedBox(height: 20),
                      Text(
                        "Attachment",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("${widget.doc.title.substring(0, 10)}.docx"),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
