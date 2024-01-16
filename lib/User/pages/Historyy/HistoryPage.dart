import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gohealing/User/pages/Detail/Order/DetailOrderPage.dart';
import 'package:gohealing/User/widgets/Card/WidgetCardOrder.dart';
import 'package:gohealing/data/DBorder.dart';
import 'package:gohealing/User/widgets/Card/WidgetCardOrder.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController searchC = TextEditingController();
  final DBorder _dbOrder = DBorder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _dbOrder.getWisataStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var _data = snapshot.data!.docs;

          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * (0.88),
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width * (0.3),),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "My History",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 20),
                            ),
                            width: MediaQuery.of(context).size.width * (0.3),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width * (0.25),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://awsimages.detik.net.id/community/media/visual/2019/02/19/42393387-9c5c-4be4-97b8-49260708719e.jpeg?w=600&q=90"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          WidgetCardOrder(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailOrderPage(
                                    orderData: _data[index].data(),
                                  ),
                                ),
                              );
                            },
                            nama: _data[index].data()?["nama"].toString() ?? "",
                            estimasiSampai: _data[index]
                                    .data()?["estimasiSampai"]
                                    .toString() ??
                                "",
                            berlakuSampaiTanggal: _data[index]
                                    .data()?["berlakuSampaiTanggal"]
                                    .toString() ??
                                "",
                            harga:
                                _data[index].data()?["harga"].toString() ?? "",
                            jam: _data[index].data()?["jam"].toString() ?? "",
                            kode: _data[index].data()?["kode"].toString() ?? "",
                            status:
                                _data[index].data()?["status"].toString() ?? "",
                            gambar:
                                _data[index].data()?["gambar"].toString() ?? "",
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
