import 'package:flutter/material.dart';
import 'package:masters_pms/src/presentation/auth/login.dart';
import 'package:masters_pms/src/presentation/student/complaint.dart';
import 'package:masters_pms/src/presentation/student/submissions.dart';

class settings extends StatefulWidget {
  final Map<String, dynamic> profile;
  const settings({super.key, required this.profile});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    onPressed: ()=> Navigator.pop(context), 
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white)
                    ),
                  Text(
                    "Settings",
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
                height: 700,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 221, 221),
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          SizedBox(width: 16.0),
                          Transform.scale(
                            scale: 1.5,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/profile.png'),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.profile['first_name']} ${widget.profile['last_name']}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                                ),
                              ),
                              Text(
                                "${widget.profile['educ_bg']['name']}",
                                style: TextStyle(
                                  color: Colors.grey[700]
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Divider(thickness: 1,),
                      Text(
                        "Account Settings",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.grey[700]
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: null,
                            child: Text(
                              "Previous Submissions",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => complaint(profile: widget.profile,))),
                            child: Text(
                              "Make a complaint",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                      
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: null,
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                      
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: null,
                            child: Text(
                              "Change Password",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                      
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: null,
                            child: Text(
                              "Help",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                      Divider(thickness: 1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login())), 
                            child: Text("Log Out")
                            ),
                            Icon(Icons.logout)
                        ],
                      )
                    ]
                  ),
                )
              ),
            )
        ],
      )
    );
  }
}