import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class tutorLogin extends StatefulWidget {
  const tutorLogin({Key? key}) : super(key: key);

  @override
  State<tutorLogin> createState() => _tutorLoginState();
}

class _tutorLoginState extends State<tutorLogin> {
  //Create necessary form attributes
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

                      SizedBox(
                        height: 25,
                      ),

                      //Password Feild
                      TextFormField(
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

                      SizedBox(
                        height: 40,
                      ),

                      //Creating submit button
                      ElevatedButton(
                        onPressed: () {},
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
                            onPressed: () {},
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
}
