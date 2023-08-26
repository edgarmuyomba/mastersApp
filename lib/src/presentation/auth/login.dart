import 'package:flutter/material.dart';
import 'package:masters_pms/src/presentation/student/home.dart';
import 'package:masters_pms/src/presentation/student/noTopic.dart';
import 'package:masters_pms/src/presentation/supervisor/dashboard.dart';
import '../../models/db_controllers.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool isLoading = false;

  void handleStdNav(account) {
    if (account['profile']['topic'] == '')
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => noTopic(profile: account['profile'])));
    else
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => stdHome(profile: account['profile'])));
  }

  void logIn() {
    FocusScope.of(context).unfocus();
    setState(() {
      isLoading = true;
    });
    AuthService _auth = AuthService();
    Map<String, dynamic> account = _auth.login(_email.text.trim());

    if (!account['status']) {
      setState(() {
        isLoading = false;
      });
      // display error message if login fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Invalid credentials')),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      if (_auth.checkStdRole(account['profile']['email']))
        handleStdNav(account);
      else if (_auth.checkSupRole(account['profile']['email']))
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    supDashboard(profile: account['profile'])));
      else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Something went wrong')),
        );
      }
    }
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
                    SizedBox(height: 200),
                    Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
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
                    children: [
                      SizedBox(height: 40),
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Enter your email",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@'))
                            return "Please enter a valid email";
                          else
                            return null;
                        },
                      ),
                      SizedBox(height: 32.0),
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter your password",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                        validator: (value) {
                          if (value!.isEmpty)
                            return "Please enter your password";
                          else
                            return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: null,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) logIn();
                        },
                        child: Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 51, 75, 85),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(
                                child: isLoading
                                    ? CircularProgressIndicator(
                                        strokeWidth: 2,
                                      )
                                    : Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                        )
                                      ))),
                      ),
                      SizedBox(
                        height: 200,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
