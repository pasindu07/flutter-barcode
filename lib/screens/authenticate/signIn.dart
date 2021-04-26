import 'package:barcode/services/auth.dart';
import 'package:barcode/shared/loading.dart';
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
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.green[50],
            appBar: AppBar(
              backgroundColor: Colors.blue[700],
              title: Text('Bar Code Reader'),
            ),
            body: Wrap(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 250.0, 0.0, 0.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Email'),
                          validator: (value) =>
                              value.isEmpty ? 'Enter an Email' : null,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          obscureText: true,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password'),
                          validator: (value) =>
                              value.isEmpty ? 'Enter The Password' : null,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton.icon(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                            }

                            dynamic result = await _auth
                                .logInWithEmailAndPassword(email, password);

                            if (result == null) {
                              setState(() {
                                error = 'Sign In Failed';
                                loading = false;
                              });
                            }
                          },
                          icon: Icon(Icons.login_rounded),
                          label: Text('Sign In'),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 110.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        widget.toggleView();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green[400]),
                      ),
                      icon: Icon(Icons.app_registration),
                      label: Text('Not a Member?'),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
