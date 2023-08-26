import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  final Map<String, dynamic> account;
  const profile({super.key, required this.account});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Icon(Icons.menu, size: 32),
              Expanded(child: SizedBox()),
              Icon(Icons.settings, size: 32),
              SizedBox(width: 10.0),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
              )
            ],
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Container(
            height: 700,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 221, 221, 221),
              borderRadius: BorderRadius.circular(25)
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                     ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                      child: Image.asset('assets/images/banner.png', fit: BoxFit.cover,)),
                    
                        Padding(
                          padding: EdgeInsets.fromLTRB(32, 160, 16, 16),
                          child: Transform.scale(
                              scale: 2.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                padding: EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                            backgroundImage: AssetImage('assets/images/profile.png'),
                                          ),
                              ),
                            ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(110, 170, 16, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${widget.account['first_name']} ${widget.account['last_name']}", style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20
                              ),),
                              Text("${widget.account['educ_bg']['name']}",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[700]
                              ),
                              )
                            ],
                          ),
                        )
                  ],
                ),
                Divider(thickness: 1,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Surname:", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          )),
                          Text("Other names:", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          )),
                          Text("Email:", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          )),
                          Text("Phone Number:", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          )),
                          Text("Gender", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          )),
                          Text("Bio:", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          )),
                          Text("D.O.B:", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ),
        )
      ],
    );
  }
}