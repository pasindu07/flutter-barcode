import 'package:barcode/models/fireUser.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{


  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Creating a user object besed on the firebase user
  FireUser _userFromFireUser(User user){
    return user != null ? FireUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<FireUser> get user{
    return _auth
        .authStateChanges()
        .map(_userFromFireUser);
  }

  //sign in with email and password
  Future logInWithEmailAndPassword(String email,String password) async{
    try{
        UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
        User user = result.user;
        return _userFromFireUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailandPassword(String email,String password) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFireUser(user);
    } catch(e){
      // if(e.code=='auth/email-already-in-use') 
      print(e.toString());
      return null;
    }
  }



}