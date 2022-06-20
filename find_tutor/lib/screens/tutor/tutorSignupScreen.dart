import 'package:email_validator/email_validator.dart';
import 'package:find_tutor/screens/tutor/tutorLoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class tutorSignup extends StatefulWidget {
  const tutorSignup({Key? key}) : super(key: key);

  @override
  State<tutorSignup> createState() => _tutorSignupState();
}

class _tutorSignupState extends State<tutorSignup> {
  //creating form key
  final _formKey = GlobalKey<FormState>();

  //creating variables to hold data from each field
  final tutorFirstName = TextEditingController();
  final tutorLastName = TextEditingController();
  final tutorEmail = TextEditingController();
  final tutorTelephone = TextEditingController();
  final tutorPassword = TextEditingController();
  final tutorConfirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8884FF),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 35, 15, 10),
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
                  height: 15,
                ),

                //Creating Login form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //First name field
                      TextFormField(
                        controller: tutorFirstName,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{3,}$');
                          if (value!.isEmpty) {
                            return ("First Name cannot be Empty");
                          }
                          if (!regex.hasMatch(value)) {
                            return "Enter Valid name(Min, 3 characters)";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "First Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),

                      //sized Box
                      SizedBox(
                        height: 15,
                      ),

                      //Last name field
                      TextFormField(
                        controller: tutorLastName,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{3,}$');
                          if (value!.isEmpty) {
                            return ("Last Name cannot be Empty");
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Last Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      //sized Box
                      SizedBox(
                        height: 15,
                      ),
                      //Email Field
                      TextFormField(
                        controller: tutorEmail,
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

                      //sizedBox
                      SizedBox(
                        height: 15,
                      ),

                      //telephone
                      TextFormField(
                        controller: tutorTelephone,
                        obscureText: false,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone_android),
                          labelText: "Telephone",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      //Password Feild
                      TextFormField(
                        controller: tutorPassword,
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

                      //SziedBox
                      SizedBox(
                        height: 15,
                      ),

                      //Confirm Password Field
                      TextFormField(
                        controller: tutorConfirmPassword,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) {
                          if (tutorConfirmPassword.text.length > 6 &&
                              tutorPassword.text != value) {
                            return "Passwords don't match";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: "Confirm Password",
                            border: OutlineInputBorder(
                                gapPadding: 4.0,
                                borderRadius: BorderRadius.circular(30))),
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      //Creating submit button
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Signup",
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
                        height: 10,
                      ),

                      //ROW CONTAINING LINK TO LOGIN FORM
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => tutorLogin())));
                            },
                            child: Text(
                              "Login",
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
      )),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      // await _auth.createUserWithEmailAndPassword(email: email, password: password)
      //   .then((value) => {
      //     postDetailsToFirestore();
      //   }).catchError((e){
      //     Fluttertoast.showToast(msg: e!.message);
      //   })
    }
  }

  postDetailsToFirestore() async {}
}
