import 'package:flutter/material.dart';
import 'package:gohealing/User/pages/LoginPage/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetCardSouvenir extends StatelessWidget {
  const WidgetCardSouvenir({
    Key? key,
    required this.onTap,
    required this.judulSouvenir,
    required this.harga,
    required this.gambar,
  }) : super(key: key);

  final VoidCallback onTap;
  final String judulSouvenir;
  final String harga;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          color: Color(0xFFBFC4F0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 140,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    gambar,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * (0.4),
                      child: Text(
                        judulSouvenir,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            fontFamily: GoogleFonts.poppins().fontFamily),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rp. $harga",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * (0.47),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.only(left: 30, right: 30),
                                  backgroundColor: Color(0xFF18227B),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                print("klik beli");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ));
                              },
                              child: Text(
                                "BELI",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w800),
                              )),
                              IconButton(onPressed: () {
                                print("klik keranjang");
                              }, 
                              icon: Icon(Icons.shopping_cart, color: Color(0xFF18227B),),)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
