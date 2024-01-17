import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WidgetTest extends StatefulWidget {
  const WidgetTest({Key? key}) : super(key: key);

  @override
  _WidgetTestState createState() => _WidgetTestState();
}

class _WidgetTestState extends State<WidgetTest> {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan pengguna saat ini
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (user != null)
              Text('Email pengguna: ${user.email!}'),
            if (user == null)
              Text('Tidak ada pengguna yang terautentikasi'),
          ],
        ),
      ),
    );
  }
}
