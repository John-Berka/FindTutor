import 'package:email_validator/email_validator.dart';
import 'package:find_tutor/screens/tutor/tutorLoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
                        validator: (email) {
                          if (email == null || EmailValidator.validate(email)) {
                            return "Enter a valid email";
                          }
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
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }
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
                          if (tutorConfirmPassword != tutorPassword) {
                            return "Passwords don't match";
                          }
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
}
