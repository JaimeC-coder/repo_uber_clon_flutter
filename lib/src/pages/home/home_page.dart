import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uber/src/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController _con = HomeController();
  @override
  Widget build(BuildContext context) {
    _con.init(context);
    //scaffold es todo el cuerpo de la app
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Container(
          decoration: _decorationbox(),
          child: Column(
            children: [
              _clipPath(context),
              _size(50),
              _textUser(),
              _size(30),
              _imgRol(context,'assets/img/pasajero.png'),
              _textRol('Cliente'),
              _size(30),
              _imgRol(context,'assets/img/driver.png'),
              _textRol('Conductor'),
            ],
          ),
        ),
      ),
    );
  }

  //metodos para el texto
  Widget _textUser(){
    return const Text('Selecciona tu Rol',
    style: TextStyle(
        fontFamily: 'OneDay',
        fontSize: 20,
        color: Colors.white70
    ),
    );
  }
  Widget _textRol(String rol){
   return Text(
     rol,
      style: const TextStyle(
          fontSize: 20,
          color: Colors.white70
      ),
    );
  }
  Widget _imgRol(BuildContext context,String img){
    return GestureDetector(
      onTap: _con.goToLoginPage,
      child: CircleAvatar(
        backgroundImage: AssetImage(img),
        radius: 50,
        backgroundColor: Colors.white70,
      ),
    );
  }
  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Image.asset('assets/img/logo_app.png',
            width: 150,
            height: 100,
          ),
          const Text('Facil y Rapido',
            style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black54
            ),
          )
        ]
    );
  }
  Widget _size(double size){
    return SizedBox(height: size);
  }
  BoxDecoration _decorationbox(){
    return  const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.black,
          Colors.white70,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
  Widget _navbar(){
    //El gion bajo es para que no se pueda acceder a este metodo desde fuera de la clase
    //TODO por si se quiere implementar un navbar
    //appBar: AppBar(title: const Text('Uber'),),
    return  AppBar(
      title: const Text('Uber'),
    );
  }
  Widget _clipPath(BuildContext context) {
    return ClipPath(
      clipper: DiagonalPathClipperTwo(),
      child: Container(
        color: Colors.white70,
        height: MediaQuery.of(context).size.height * 0.3,
        child: _header(),
      ),
    );
  }

}
