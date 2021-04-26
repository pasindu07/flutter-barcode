import 'package:flutter/material.dart';
import 'package:barcode/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        centerTitle: false,
        title: Text(
          'Scan',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            label: Text(
              'Log Out',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_rounded),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_rounded),
            label: 'Results',
          ),
        ],
      ),
    );
  }
}
