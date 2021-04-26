import 'package:flutter/material.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool signInView = true;

  //to toggle between states
  void toggleView(){
    setState(() {
      signInView = !signInView;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(signInView)
      return SignIn(toggleView: toggleView);
    else  
      return Register(toggleView: toggleView);
  }
}