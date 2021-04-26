import 'package:barcode/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:barcode/shared/constant.dart';



class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  
  //text field var
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Bar Code Reader'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
        padding: EdgeInsets.symmetric(horizontal:50.0,vertical:20.0),
        child: Form(
          key: _formKey,
          child:Column(
            children: <Widget>[
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Email'),
                validator: (value) => value.isEmpty?'Enter an Email':null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Password'),
                validator: (value) => value.isEmpty?'Enter The Password':null,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height:20.0),
              ElevatedButton.icon(
                onPressed: (){},
                icon: Icon(Icons.login),
                label: Text('Sign In'), 
              ),
          ],),
        ),
      ),
    );
  }
}