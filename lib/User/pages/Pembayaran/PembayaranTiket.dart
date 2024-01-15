import "package:flutter/material.dart";
import "package:gohealing/User/pages/Detail/Tiket/DetalTiketPage.dart";

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  print("klik ke detail");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailTiketPage(),
                      ));
                },
                icon: Icon(Icons.payment_rounded)),
          )
        ],
        title: Text("Pembayaran pak rei"),
        // ABIS PAGE INI, BAKALAN NGARAH KE DETAIL TIKET PAK LEWAT TOMBOL INI
      ),
    );
  }
}
