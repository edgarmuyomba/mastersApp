import 'package:flutter/material.dart';
import 'package:masters_pms/src/models/models.dart';

class makeSubmission extends StatelessWidget {
  final Task task;
  const makeSubmission({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController _comment = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      task.title,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    Card(
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Icon(Icons.file_upload_rounded,
                                color: Colors.white),
                            Text(
                              "Upload",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _comment,
                          maxLines: 5,
                          decoration: InputDecoration(
                              labelText: "Comment",
                              hintText: "Write a comment",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 5.0),
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) {
                            if (value!.isEmpty) return "Please enter a comment";
                            return null;
                          },
                        ),
                        SizedBox(height: 10.0),
                        InkWell(
                            onTap: null,
                            child: Container(
                              alignment: Alignment.center,
                                width: double.infinity,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 97, 233, 101),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Submit",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 72, 2),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15
                                  ),
                                ))),
                        SizedBox(height: 10.0),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
