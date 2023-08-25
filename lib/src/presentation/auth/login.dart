import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Sign In"),
          Form(
            child: Column(
              children: [
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) return "Please enter a valid email";
                    else return null;
                  },
                ),
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) return "Please enter a valid email";
                    else return null;
                  },
                )
              ],
            )
            )
        ],
      ),
    );
  }
}