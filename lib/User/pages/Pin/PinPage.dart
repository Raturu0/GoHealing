import "package:flutter/material.dart";
import 'package:gohealing/User/BottomConvexBarr/BottomConvexBarr.dart';
import "package:gohealing/User/pages/tiketBerhasil/tiketBerhasilPage.dart";
import "package:pinput/pinput.dart";

class PinPage extends StatefulWidget {
  final Map<String, dynamic>? tempatWisataData;

  const PinPage({Key? key, required this.tempatWisataData})
      : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  bool pinError = false; // Tambahkan variabel untuk melacak kesalahan PIN

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Color(0xFFBFC4F0),
        border: Border.all(color: Color(0xFFBFC4F0)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.amber,
      ),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Setel Pin Baru Anda ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(
              height: 20,
            ),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                setState(() {
                  pinError = s != '2222'; // Set variabel pinError jika PIN salah
                });
                return pinError ? '' : null;
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) {
                if (pin == "2222") {
                  // Jika pin benar, navigasi ke halaman baru
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TiketBerhasilPage(
                                    tempatWisataData: widget.tempatWisataData,

                    )),
                  );
                } else {
                  print("Pin salah!",);
                }
              },
            ),
            if (pinError)
              Center(
                child: Text(
                  'PIN Salah!',
                  style: TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
