import 'package:barcode/models/fireUser.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{


  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Creating a user object besed on the firebase user
  FireUser _userFromFireUser(User user){
    return user != null ? FireUser(uid: user.uid) : null;
  }

  Stream<FireUser> get user{
    return _auth
        .authStateChanges()
        .map(_userFromFireUser);
  }


}