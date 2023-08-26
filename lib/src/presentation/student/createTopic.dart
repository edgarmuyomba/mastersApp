import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:masters_pms/src/db/topics.dart';
import 'package:masters_pms/src/models/db_controllers.dart';
import 'package:masters_pms/src/models/models.dart';
import 'package:masters_pms/src/presentation/student/dashboard.dart';
import 'package:masters_pms/src/presentation/student/home.dart';
import 'package:masters_pms/src/utils/get_id.dart';

class createTopic extends StatefulWidget {
  final Map<String, dynamic> profile;
  const createTopic({super.key, required this.profile});

  @override
  State<createTopic> createState() => _createTopicState();
}

class _createTopicState extends State<createTopic> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController plan = TextEditingController();
  TextEditingController supervisor = TextEditingController();

  String? filePath;

  late List<String> themes;
  late String selectedTheme;
  TagService _tagService = TagService();

  List<String> plans = ["Plan A", "Plan B"];
  late String selectedPlan;

  AuthService _authService = AuthService();
  late List<String> supervisors;
  late String selectedSup;

  bool isLoading = false;

  late FocusNode themeNode;

  late Map<String, dynamic> newTopic;

  void saveTopic(newTopic) {
    Topic _newTopic = new Topic(
        // id: get_id(),
        title: newTopic['title'],
        theme: _tagService.get_tag_id(newTopic['theme']),
        supervisor: _authService.fetchSupId(newTopic['supervisor']),
        student: widget.profile['id'],
        plan: newTopic['plan'],
        // stage: "Proposal",
        // completion: 0
        );
    TopicService.saveTopic(_newTopic);
    widget.profile['topic'] = _newTopic.id;
  }

  @override
  void initState() {
    super.initState();
    themeNode = FocusNode();
    themes = _tagService.fetchTagNames();
    selectedTheme = themes.first;
    selectedPlan = plans.first;
    supervisors = _authService.fetchSupNames();
    selectedSup = supervisors.first;
    newTopic = {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 38, 50, 56),
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(0),
                        bottom: Radius.elliptical(2000, 600))),
                child: Column(
                  children: [
                    SizedBox(height: 150),
                    Text(
                      "Propose A\nTitle",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          fontSize: 32),
                    ),
                    SizedBox(height: 30)
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32),
                        TextFormField(
                          controller: title,
                          decoration: InputDecoration(
                              labelText: "Title",
                              hintText: "Enter a title",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          onChanged: (value) {
                            newTopic['title'] = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty)
                              return "Please enter a title";
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.0),
                            Text("Plan"),
                            DropdownMenu(
                              width: 380,
                              initialSelection: selectedPlan,
                              onSelected: (String? value) {
                                setState(() {
                                  selectedPlan = value!;
                                });
                                newTopic['plan'] = value;
                              },
                              dropdownMenuEntries: plans.map((plan) {
                                return DropdownMenuEntry(
                                  value: plan,
                                  label: plan,
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 16),
                            Text("Concept Paper"),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: ['pdf', 'doc'],
                                      );
                                      if (result != null) {
                                        setState(() {
                                          filePath =
                                              result.files.single.path![10] +
                                                  '...';
                                        });
                                      }
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 38, 50, 56),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(Icons.upload,
                                                  color: Colors.white),
                                              Text(
                                                "Upload",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))),
                                Text(filePath ?? ''),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Text("Choose Theme"),
                        DropdownMenu(
                          width: 380,
                          initialSelection: selectedTheme,
                          onSelected: (String? value) {
                            setState(() {
                              selectedTheme = value!;
                            });
                            newTopic['theme'] = value;
                          },
                          dropdownMenuEntries: themes.map((tag) {
                            return DropdownMenuEntry(
                              value: tag,
                              label: tag,
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 14),
                        Text("Supervisor"),
                        DropdownMenu(
                          width: 380,
                          initialSelection: selectedSup,
                          onSelected: (String? value) {
                            setState(() {
                              selectedSup = value!;
                            });
                            newTopic['supervisor'] = value;
                          },
                          dropdownMenuEntries: supervisors.map((sup) {
                            return DropdownMenuEntry(
                              value: sup,
                              label: sup,
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                saveTopic(newTopic);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => stdHome(
                                            profile: widget.profile)));
                              },
                              child: Container(
                                  height: 60,
                                  width: 375,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 51, 75, 85),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                  child: Center(
                                      child: isLoading
                                          ? CircularProgressIndicator(
                                              strokeWidth: 2,
                                            )
                                          : Text('Submit',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600)))),
                            ),
                          ],
                        ),
                      ])),
            )
          ],
        ),
      ),
    );
  }
}
