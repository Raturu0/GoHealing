import 'package:flutter/material.dart';

class OutputProfile extends StatelessWidget {
  final String text;
  final double jarak;
  final double tinggi; // Mengubah tipe data dari int ke double untuk tinggi

  const OutputProfile({
    Key? key,
    required this.text,
    this.jarak = 10.0,
    this.tinggi = 40.0, // Menambahkan nilai default untuk tinggi
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(jarak),
        child: Text(text),
      ),
      height: tinggi,
      width: double.infinity,
    );
  }
}
