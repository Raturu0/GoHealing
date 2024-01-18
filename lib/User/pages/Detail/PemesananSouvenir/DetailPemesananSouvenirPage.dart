import "dart:collection";

import "package:flutter/material.dart";
import "package:gohealing/User/BottomConvexBarr/BottomConvexBarr.dart";

class DetailPemesananSouvenirPage extends StatefulWidget {
  const DetailPemesananSouvenirPage({super.key});

  @override
  State<DetailPemesananSouvenirPage> createState() =>
      _DetailPemesananSouvenirPageState();
}

class _DetailPemesananSouvenirPageState
    extends State<DetailPemesananSouvenirPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Detail Pemesanan"), actions: [
        IconButton(onPressed: 
        () {
          print("klik home");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomConvexBarr(),));
        }, icon: Icon(Icons.home))
      ],),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 25, bottom: 50),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFBFC4F0),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/img/gancicb.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 150,
                      color: Color(0xFFBFC4F0),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gantungan Kunci Candi Borobudur",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text("Jumlah : 2"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text("Rp. 20.000")],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFBFC4F0),
                ),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal Produk"),
                        Text("Rp.20.000,00"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Biaya Pengiriman"),
                        Text("Rp.10.000,00"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Biaya Penanganan"),
                        Text("Rp.1.000,00"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Biaya Layanan"),
                        Text("Rp.900,00"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Pesanan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Rp.31.900,00",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFFBFC4F0),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alamat Pengiriman,",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Isabel Kurniawan",
                      ),
                      Text(
                        "0857-9876-9325",
                      ),
                      Text(
                        "Jl. Kaliurang No 10, Gondangan, Sardonoharjo, Ngaglik,",
                      ),
                      Text(
                        "Sleman, DIY",
                      )
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFBFC4F0),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Informasi Pengiriman",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Reguler"),
                    Text("J&T Express - JP983DIDDK893"),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.grey[700],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            "Estimasi Sampai - 29-12-2023",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.green,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            "Penjual telah mengirimkan. Menunggu pesanan diserahkan kepada kurir.",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color(0xFFBFC4F0),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Metode Pembayaran",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("COD (Cash On Delivery)"),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFBFC4F0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "No. Pesanan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "KWIEOFM439024",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Waktu Pemesanan",
                        ),
                        Text("24-12-2023 21.34"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color(0xFFBFC4F0),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "FAKTUR",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "LIHAT",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * (0.3), vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: Color(0xFF2839CD)),
                  onPressed: () {
                    print("klik beli lagi");
                  },
                  child: Text("BELI LAGI", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),))
            ],
          ),
        ),
      ),
    );
  }
}
