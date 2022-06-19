import 'package:flutter/material.dart';

class tutorLoginSignUP extends StatefulWidget {
  const tutorLoginSignUP({Key? key}) : super(key: key);

  @override
  State<tutorLoginSignUP> createState() => _tutorLoginSignUPState();
}

class _tutorLoginSignUPState extends State<tutorLoginSignUP> {
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
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
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
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
