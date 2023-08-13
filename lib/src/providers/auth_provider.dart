import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider{
  FirebaseAuth? _auth;

  AuthProvider(){
    _auth = FirebaseAuth.instance;
  }
  User? getUser(){
    return _auth?.currentUser;
  }
  Future<bool> login(String email, String password) async{
    String errorMessage = '';
    try{

      await _auth!.signInWithEmailAndPassword(email: email, password: password);
      //return true;
    }catch(e){
      errorMessage = e.hashCode.toString();
      print(e);
      //return false;
    }
    if(errorMessage != ''){
      return Future.error(errorMessage);
    }
    return true;

  }

  Future<bool> register(String email, String password,String name) async{
    String errorMessage = '';
    try{

      await _auth!.createUserWithEmailAndPassword(email: email, password: password);
      //return true;
    }catch(e){
      errorMessage = e.hashCode.toString();
      print(e);
      //return false;
    }
    if(errorMessage != ''){
      return Future.error(errorMessage);
    }
    return true;

  }

}