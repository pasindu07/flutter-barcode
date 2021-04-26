import 'package:barcode/models/fireUser.dart';
import 'package:barcode/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:barcode/services/auth.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Running the app
  runApp(BarCodeApp());
}


class BarCodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FireUser>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),

      )
  }
}