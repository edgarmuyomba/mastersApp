import 'package:flutter/material.dart';
import 'package:masters_pms/src/presentation/student/dashboard.dart';
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

  void logIn() {
    print("nnnnnnnnnn");
    setState(() {
      isLoading = true;
    });
    AuthService _auth = AuthService();
    Map<String, dynamic> profile = _auth.login(_email.text);

    if (!profile['status']) {
      setState(() {
        isLoading = false;
      });

      // display error message if login fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid credentials')),
      );
    } else {
      if (_auth.checkStdRole(profile['email'])) Navigator.push(context, MaterialPageRoute(builder: (context) => stdDashboard()));
      else if(_auth.checkSupRole(profile['email'])) Navigator.push(context, MaterialPageRoute(builder: (context) => supDashboard()));
      else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Something went wrong')),
      );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: Container()),
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
                    if (value!.isEmpty || !value.contains('@'))
                      return "Please enter a valid email";
                    else
                      return null;
                  },
                ),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                  ),
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Please enter your password";
                    else
                      return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: null,
                      child: Text("Forgot Password?"),
                    ),
                  ],
                ),
                InkWell(
                    onTap: () => logIn(),
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
                                        'Login',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ))),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ))),
                        SizedBox(height: 200,)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
