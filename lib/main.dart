import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gohealing/User/BottomConvexBarr/BottomConvexBarr.dart';
import 'package:gohealing/TEST/WidgetTest.dart';
import 'package:gohealing/User/pages/Detail/PemesananSouvenir/DetailPemesananSouvenirPage.dart';
import 'package:gohealing/User/pages/Pembayaran/PembayaranTiket.dart';
import 'package:gohealing/User/pages/Pin/PinPage.dart';
import 'package:gohealing/User/pages/ProfilePage/ProfilePage.dart';
import 'package:gohealing/User/pages/RegisterPage/RegisterPage.dart';
import 'package:gohealing/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    // sudah login?
    if (FirebaseAuth.instance.currentUser != null) {
      return MaterialApp(
        home: BottomConvexBarr(),
      );
    } else {
      return MaterialApp(
        home: RegisterPage(),
      );
    }

    // return MaterialApp(
    //   home: DetailPemesananSouvenirPage(),
    // );

  }
}
