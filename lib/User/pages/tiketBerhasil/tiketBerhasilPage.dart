import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:gohealing/BottomConvexBarr/BottomConvexBarr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gohealing/User/pages/Detail/Tiket/DetalTiketPage.dart';

class TiketBerhasilPage extends StatefulWidget {
  final Map<String, dynamic>? tempatWisataData;

  const TiketBerhasilPage({Key? key, required this.tempatWisataData})
      : super(key: key);
  @override
  State<TiketBerhasilPage> createState() => _TiketBerhasilPageState();
}

class _TiketBerhasilPageState extends State<TiketBerhasilPage> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomConvexBarr(),
                      ));
                },
                icon: Icon(Icons.home_filled)),
          )
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      // decoration: BoxDecoration(border: Border.all(width: 2.0)),
                      child: Text(
                        'Selamat !',
                        style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      // decoration: BoxDecoration(border: Border.all(width: 2.0)),
                      child: Text(
                        'Tiket Anda Siap Digunakan.',
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 25,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width * (0.86),
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0xFFBFC4F0),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: DottedDecoration(
                        color: Colors.black,
                        strokeWidth: 1.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              widget.tempatWisataData?['tempatWisata'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Container(
                            child: Text(widget.tempatWisataData?['lokasi']),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: DottedDecoration(
                        color: Colors.black,
                        strokeWidth: 1.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${user!.email}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Berlaku Sampai',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('23 Agustus 2023')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Image.asset('assets/img/scan.png'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailTiketPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Detail Tiket',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
