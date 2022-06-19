import 'package:email_validator/email_validator.dart';
import 'package:find_tutor/screens/tutor/tutorProfileScreen.dart';
import 'package:find_tutor/screens/tutor/tutorSignupScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class tutorLogin extends StatefulWidget {
  const tutorLogin({Key? key}) : super(key: key);

  @override
  State<tutorLogin> createState() => _tutorLoginState();
}

class _tutorLoginState extends State<tutorLogin> {
  //Create necessary form attributes
  // ignore: unused_field
  final _formKey = new GlobalKey<FormState>();
  final TextEditingController tutorLoginEmail = new TextEditingController();
  final TextEditingController tutorLoginPassword = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Center(child: Text("Borize")),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff8884FF),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 45, 15, 10),
          // Wrapping evercomponent in a column
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //inserting main image
                Image.asset(
                  "assets/tutor.png",
                  width: 300,
                  height: 250,
                ),

                const SizedBox(
                  height: 30,
                ),

                //Creating Login form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //Email Field
                      TextFormField(
                        controller: tutorLoginEmail,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        autofillHints: [AutofillHints.email],
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Email";
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                      ),

                      SizedBox(
                        height: 25,
                      ),

                      //Password Feild
                      TextFormField(
                        controller: tutorLoginPassword,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{6,}');
                          if (value!.isEmpty) {
                            return "Please Enter your Password";
                          }

                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Password(Min. 6 Characters");
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: "Password",
                            border: OutlineInputBorder(
                                gapPadding: 4.0,
                                borderRadius: BorderRadius.circular(30))),
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      //Creating submit button
                      ElevatedButton(
                        onPressed: () {
                          signIn(tutorLoginEmail.text, tutorLoginPassword.text);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            fixedSize: Size(350, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),

                      //creating sized box
                      SizedBox(
                        height: 20,
                      ),

                      //Row containing link to signup form
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => tutorSignup())));
                            },
                            child: Text(
                              "Signup",
                              style: TextStyle(color: Color(0xff8884FF)),
                            ),
                            style: TextButton.styleFrom(
                              onSurface: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Sucessful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => tutorProfile()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
