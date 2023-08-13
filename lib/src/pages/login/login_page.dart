import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uber/src/pages/login/login_controller.dart';
import 'package:uber/src/utils/colors.dart' as utilscolors;
import 'package:uber/src/widgets/button_app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  //const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final RegisterController _con = RegisterController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    //initState();
    return Scaffold(
      //key: _con.key,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _clipPath(context),
            _size(30),
            _textsMain(),
            _size(MediaQuery.of(context).size.height * 0.05),
            _textsFields(),
            _size(MediaQuery.of(context).size.height * 0.1),
            _buttonSessions(),
          ],
        ),
      ),
    );
  }

  Widget _clipPath(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        color: utilscolors.Colors.banerGeneral,
        height: MediaQuery.of(context).size.height * 0.2,
        child: _header(),
      ),
    );
  }

  Widget _header() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/img/logo_app.png',
            width: 150,
            height: 100,
          ),
          const Text(
            'Facil y Rapido',
            style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          )
        ]);
  }

  Widget _size(double size) {
    return SizedBox(height: size);
  }

  Widget _textsMain() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Continua con tu',
            style: TextStyle(
              fontFamily: 'NimbusSans',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          Text(
            'Login',
            style: TextStyle(
              fontFamily: 'NimbusSans',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _textsFields() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Column(
        children: [
          TextField(
            controller: _con.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'correo@correo.com',
              labelText: 'Correo Electrónico',
              suffixIcon: Icon(
                Icons.email_outlined,
                color: utilscolors.Colors.banerGeneral,
              ),
            ),
          ),
          _size(20),
          TextField(
            controller: _con.passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: '*********',
              labelText: 'Contraseña',
              suffixIcon: Icon(
                Icons.lock_open_outlined,
                color: utilscolors.Colors.banerGeneral,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonSessions() {
    return Container(
      alignment: Alignment.center,
      //margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      margin: const EdgeInsets.only(bottom: 50, left: 35, right: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              alignment: Alignment.center,
              child: ButtonApp(
                  onPressed: _con.login,
                  color: utilscolors.Colors.banerGeneral,
                  text: 'Iniciar Sesión')),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {_con.register();},
              child: const Text(
                'No tienes cuenta?',
                style: TextStyle(
                  fontFamily: 'NimbusSans',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
