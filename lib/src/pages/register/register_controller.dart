import 'package:flutter/material.dart';
import 'package:uber/src/pages/models/client.dart';
import 'package:uber/src/providers/auth_provider.dart';
import 'package:uber/src/providers/client_provider.dart';

class RegisterController{
  BuildContext? context ;
  final TextEditingController emailController = TextEditingController();
  final  TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController verificpasswordController = TextEditingController();
  late final AuthProvider _authProvider;
  late final ClientProvider _clientProvider;

  Future? init(BuildContext context){
    this.context = context;
    _authProvider = AuthProvider();
    _clientProvider = ClientProvider();
    return null;
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

  void register() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String name = nameController.text;
    String verificpassword = verificpasswordController.text.trim();
    print('Email: $email' " - "  'Password: $password' " - " 'Name: $name' " - " 'VerificPassword: $verificpassword');
    if(email.isEmpty || password.isEmpty || name.isEmpty || verificpassword.isEmpty){
      print('Llene todos los campos');
      return;
    }
    if(password.length < 6){
      print('La contraseña debe tener al menos 6 caracteres');
      return;
    }
  if(password != verificpassword ){
    print('Las contraseñas no coinciden');
    return ;
  }

    try{
      bool isRegister = await _authProvider.register(email, password, name);
      if(isRegister){
        Client client = Client(id: _authProvider.getUser()!.uid, username: name, email: email, password: password);
        await _clientProvider.create(client);

        print('Usuario registrado');
      }else{
        print('Usuario no registrado');
      }
    }catch (e){

      print('Error: $e');

    }
  }
}