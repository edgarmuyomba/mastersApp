import 'package:flutter/material.dart';
import 'package:masters_pms/src/presentation/student/home.dart';

class complaint extends StatefulWidget {
  final Map<String, dynamic> profile;
  const complaint({super.key, required this.profile});

  @override
  State<complaint> createState() => _complaintState();
}

class _complaintState extends State<complaint> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
                    Text(
                      "Complaints",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
          SizedBox(height: 32.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Need Help?",
              style: TextStyle(
                color: Color.fromARGB(255, 37, 50, 56),
                fontWeight: FontWeight.w700,
                fontSize: 24
              )
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: Text(
                    "We are here to help you.\nSend us any complaint about a problem \nthat is inconveniencing you.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _title,
                      decoration: InputDecoration(
                          labelText: "Title",
                          hintText: "Brief description of the problem",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                      validator: (value) {
                        if (value!.isEmpty) return "Please enter a title";
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _description,
                      maxLines: 4,
                      decoration: InputDecoration(
                          labelText: "Descrition",
                          hintText: "Describe the problem in detail",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                      validator: (value) {
                        if (value!.isEmpty) return "Please enter a description";
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate())
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        stdHome(profile: widget.profile)));
                          return null;
                        },
                        child: Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 37, 50, 56),
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text("Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600))))
                  ],
                )),
          )
              ],
            ),
        ));
  }
}
