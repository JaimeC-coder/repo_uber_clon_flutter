import 'package:flutter/material.dart';
import 'package:uber/src/providers/auth_provider.dart';

class RegisterController{
  BuildContext? context ;
  final TextEditingController emailController = TextEditingController();
  final  TextEditingController passwordController = TextEditingController();
  late final AuthProvider _authProvider;

  Future? init(BuildContext context){
    this.context = context;
    _authProvider = AuthProvider();
    return null;
  }
  void register(){
    Navigator.pushNamed(context!, 'register');
  }
  void login() async{
    String email = emailController.text;
    String password = passwordController.text;
    print('Email: $email' "-"  'Password: $password');

    try{
      bool islogin = await _authProvider.login(email, password);
      if(islogin){
        print('Usuario logueado');
      }else{
        print('Usuario no logueado');
      }
    }catch (e){

      print('Error: $e');

    }
  }
}