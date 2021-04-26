import 'package:barcode/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:barcode/models/fireUser.dart';
import 'package:barcode/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user  = Provider.of<FireUser>(context);

    if(user==null)
      return Authenticate();
    else
      return Home();
  }
}