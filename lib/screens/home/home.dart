import 'package:barcode/screens/contents/results.dart';
import 'package:barcode/screens/contents/scan.dart';
// import 'package:barcode/screens/home/placeHold.dart';
import 'package:flutter/material.dart';
import 'package:barcode/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Scan(),
    Results(),
    // PlaceholderWidget(Colors.amber),
    // PlaceholderWidget(Colors.green),
  ];
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        centerTitle: false,
        elevation: 0.0,
        title: Text(
          'Barcode Scanner',
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
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTap,
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

  void onTabTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}
