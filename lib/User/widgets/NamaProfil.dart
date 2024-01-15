import 'package:flutter/material.dart';

class NamaProfil extends StatelessWidget {
  final String text;

  const NamaProfil({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.topLeft,
      child: Text(text),
    );
  }
}
