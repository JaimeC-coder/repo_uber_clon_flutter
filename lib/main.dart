import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uber/src/pages/home/home_page.dart';
import 'package:uber/src/pages/login/login_page.dart';
import 'package:uber/src/pages/register/register_page.dart';
import 'package:uber/src/utils/colors.dart' as utilscolors;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//el stateful widget es un widget que puede cambiar su estado y darle interactividad a la app
class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber',
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NimbusSans',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: utilscolors.Colors.banerGeneral,
        ),
        primaryColor: utilscolors.Colors.banerGeneral,
      ),
      routes: {
        'home': (BuildContext context) => HomePage(),
        'login': (BuildContext context) => const LoginPage(),
        'register': (BuildContext context) => const RegisterPage(),
      },
    );
  }
}
