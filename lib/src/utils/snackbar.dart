// import 'package:flutter/material.dart';
// import 'package:uber/src/utils/colors.dart' as utilscolors;
//
// class SnackBarWidget {
//   static void showbarSnack(
//       BuildContext context, GlobalKey<ScaffoldState> key, String message) {
//     final scaffoldState = key.currentState;
//     if (scaffoldState == null) return;
//     FocusScope.of(context).requestFocus(FocusNode());
//     scaffoldState?.removeCurrentSnackBar();
//     scaffoldState.showSnackBar(SnackBar(
//       content: Text(
//         message,
//         style: const TextStyle(color: Colors.white, fontSize: 14),
//       ),
//       backgroundColor: utilscolors.Colors.banerGeneral,
//       duration: const Duration(seconds: 3),
//     ));
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:uber/src/utils/colors.dart' as utilscolors;

class Snackbar {
  static void showSnackbar(BuildContext context, GlobalKey<ScaffoldState> key, String text) {
    if (context == null || key == null || key.currentState == null) return;

    FocusManager.instance.primaryFocus?.unfocus();

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        backgroundColor: utilscolors.Colors.banerGeneral,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
