import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:masters_pms/src/models/db_controllers.dart';
import 'package:masters_pms/src/models/models.dart';
import 'package:masters_pms/src/presentation/student/dashboard.dart';
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
    Topic _newTopic = Topic(
      id: get_id(),
      title: newTopic['title'],
      theme: _tagService.get_tag_id(newTopic['theme']),
      supervisor: _authService.fetchSupId(newTopic['supervisor']),
      student: widget.profile['id'],
      plan: newTopic['plan'],
      stage: "Proposal",
      completion: 0
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
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Propose a title"),
          Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: title,
                      decoration: InputDecoration(
                          labelText: "Title", hintText: "Enter a title"),
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
                        Text("Concept Paper"),
                        SizedBox(height: 10),
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
                                          result.files.single.path![10] + '...';
                                    });
                                  }
                                },
                                child: Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(child: Text("Upload")),
                                ))),
                            Text(filePath ?? ''),
                          ],
                        ),
                      ],
                    ),
                    Text("Plan"),
                    DropdownButton(
                      value: selectedPlan,
                      onChanged: (String? value) {
                        setState(() {
                          selectedPlan = value!;
                        });
                        newTopic['plan'] = value;
                      },
                      items: plans.map((plan) {
                        return DropdownMenuItem(
                          value: plan,
                          child: Text(plan),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10),
                    Text("Theme"),
                    DropdownButton(
                      value: selectedTheme,
                      onChanged: (String? value) {
                        setState(() {
                          selectedTheme = value!;
                        });
                        newTopic['theme'] = value;
                      },
                      items: themes.map((tag) {
                        return DropdownMenuItem(
                          value: tag,
                          child: Text(tag),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10),
                    Text("Supervisor"),
                    DropdownButton(
                      value: selectedSup,
                      onChanged: (String? value) {
                        setState(() {
                          selectedSup = value!;
                        });
                        newTopic['supervisor'] = value;
                      },
                      items: supervisors.map((sup) {
                        return DropdownMenuItem(
                          value: sup,
                          child: Text(sup),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => stdDashboard(profile: widget.profile)));
                            },
                            child: Card(
                                child: Container(
                                    height: 70,
                                    width: 200,
                                    child: Center(
                                        child: isLoading
                                            ? CircularProgressIndicator(
                                                strokeWidth: 2,
                                              )
                                            : Text(
                                                'Submit',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ))),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                ))),
                      ],
                    ),
                  ]))
        ],
      ),
    ));
  }
}
