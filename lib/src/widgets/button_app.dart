import 'package:flutter/material.dart';
import 'package:uber/src/utils/colors.dart' as utilscolors;

class ButtonApp extends StatelessWidget {
  //const ButtonApp({super.key});
  final Color color;
  final String text;
  final Color textColor;
  final IconData icon;
  final Function? onPressed;

  const ButtonApp({
    super.key,
    required this.color,
    required this.text,
    this.textColor = Colors.white,
    this.icon = Icons.arrow_forward_ios,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'NimbusSans',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15,
                child: Icon(icon, color: utilscolors.Colors.banerGeneral),
              ),
            ),
          ],
        ));
  }
}
/*
*child: const Text(
              'Iniciar Sesión',
              style: TextStyle(
                fontFamily: 'NimbusSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

* */
