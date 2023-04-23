import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String Email = "";
  String password = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
  
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
              "Welcome!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  showAlert(),
                  TextFormField(

                    decoration: InputDecoration(
                        hintText: "Enter email", labelText: "Email"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Email = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 6) {
                        return "Password length should be at least 6";
                      }
                      return null;
                    },
                    onChanged: (value){
                       password = value;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Material(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                            setState(() {});
                                      
                                        try {
                                          final user = FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                                  email: Email,
                                                  password: password)
                                              .catchError((e) {
                                            setState(() {
                                              _error = e.message;
                                       
                                            });
                                          }).then((value) {
                                     
Navigator.pushReplacementNamed(context, "Homepage");
                                          });
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
                            : Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?", softWrap: true),
                          SizedBox(width: 0),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "SignUpPage");
                              },
                              child: Text("Create a new account")),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
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
                    Expanded(child: Text("$_error",softWrap: true,)),
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
