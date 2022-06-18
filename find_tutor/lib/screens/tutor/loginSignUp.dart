import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class tutorLoginSignUP extends StatefulWidget {
  const tutorLoginSignUP({Key? key}) : super(key: key);

  @override
  State<tutorLoginSignUP> createState() => _tutorLoginSignUPState();
}

class _tutorLoginSignUPState extends State<tutorLoginSignUP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff8884FF),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
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

              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
