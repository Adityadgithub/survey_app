import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  String? usernewPassword;
  String? usernewEmail;

  var _error;

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      // await Navigator.pushNamed(context, .homeRouts);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "images/1.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        labelText: "Email",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty";
                        } else if (!value.contains("@")) {
                          return "Invalid email";
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() {
                        usernewEmail= value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length should be at least 6";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          usernewPassword = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Confirm password",
                        labelText: "Confirm Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Confirm Password length should be at least 6";
                        }
                        //  else if (value !=
                        //     _formKey.currentState!.fields['password']!.value) {
                        //   return "Passwords do not match";
                        // }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      color: Colors.orangeAccent,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              final user = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: usernewEmail!,
                                      password: usernewPassword!)
                                  .then((value) =>
                                      Navigator.pushReplacementNamed(
                                          context, "Homepage"));
                            } on FirebaseAuthException catch (e) {
                              setState(() {
                                _error = e.message;
                              });
                              print(e);
                            }
                          }
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "SignUp",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: 0),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "LoginPage");
                        },
                        child: Text("Login your account")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

   //Error Showing Widget
  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.amberAccent,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.error_outline_outlined),
            ),
            Container(
                width: MediaQuery.of(context).size.width *0.65,
                child: 
                    Expanded(child: Text("$_error")),
                 ),
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }
}
