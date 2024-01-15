import "package:flutter/material.dart";

class PembayaranTiket extends StatefulWidget {
  const PembayaranTiket({super.key});

  @override
  State<PembayaranTiket> createState() => _PembayaranTiketState();
}

class _PembayaranTiketState extends State<PembayaranTiket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppBar(
      actions: [Icon(Icons.arrow_back)],
    ),
    
    
    );
  }
}
