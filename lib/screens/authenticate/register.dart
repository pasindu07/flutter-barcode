import 'package:barcode/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:barcode/shared/constant.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //input field var
  String email = '';
  String password = '';
  String rePassword = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Bar Code Reader'),
      ),
      body: Wrap(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 180.0, 0.0, 0.0),
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Enter Email'),
                    validator: (value) =>
                        value.isEmpty ? 'Enter an Email' : null,
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Enter Password'),
                    validator: (value) =>
                        value.isEmpty ? 'Enter an Password' : null,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Re-Enter Password'),
                    validator: (value) =>
                        value.isEmpty ? 'Re-Enter the Password' : null,
                    onChanged: (value) {
                      rePassword = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.app_registration),
                    label: Text('Register'),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
          //button to navigate to sign in
          Center(
            child: Container(
              margin: EdgeInsets.only(top:40.0),
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green[400]),
                ),
                icon: Icon(Icons.login_rounded),
                label: Text('Already a Member?'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
