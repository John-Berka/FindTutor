import 'package:find_tutor/screens/student/studentLoginScreen.dart';
import 'package:find_tutor/screens/tutor/tutorLoginScreen.dart';
import 'package:flutter/material.dart';

class getStarted extends StatelessWidget {
  const getStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //Creating Sized Box
              const SizedBox(
                height: 150,
              ),

              //Inserting Image
              Image.asset(
                "assets/start.png",
                width: 250,
                height: 250,
              ),

              //Sized Box to Provide space below image
              const SizedBox(
                height: 40,
              ),

              //Question text
              Text(
                "Who are you?",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 15),
              ),

              //SizedBox
              SizedBox(
                height: 25,
              ),

              //Creating Tutor and Student Button

              //Tutor Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => tutorLogin())));
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  // ignore: prefer_const_constructors
                  fixedSize: Size(300, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  primary: Colors.black,
                ),
                child: const Text("Tutor"),
              ),

              //Creating Space between both buttons
              SizedBox(
                height: 30,
              ),
              //Student Button
              // ignore: prefer_const_constructors
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => studentLogin())));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    fixedSize: Size(300, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                child: const Text("Student"),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
