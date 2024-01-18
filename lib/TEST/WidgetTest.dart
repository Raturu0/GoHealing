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
        body: Row(
      children: [
        Text("ya"),
        Text("ya"),
      ],
    ));
  }
}
