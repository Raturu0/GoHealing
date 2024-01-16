import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gohealing/BottomConvexBarr/BottomConvexBarr.dart';
import 'package:gohealing/TEST/WidgetTest.dart';
import 'package:gohealing/User/pages/Detail/Tiket/DetalTiketPage.dart';
import 'package:gohealing/User/pages/Pin/PinPage.dart';
import 'dart:async';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Tambahkan penundaan 2 detik sebelum memanggil runApp
  await Future.delayed(Duration(seconds: 1), () {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomConvexBarr(),
    );
  }
}














// import "package:flutter/material.dart";
// import "package:firebase_core/firebase_core.dart";
// import "package:gohealing/BottomConvexBarr/BottomConvexBarr.dart";
// import 'dart:async';

// import "package:gohealing/firebase_options.dart";
// // Semisal dari Reiki menambah di baris ini
// //  INI ADA TIDAK

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BottomConvexBarr(),
//     );
//   }
// }
