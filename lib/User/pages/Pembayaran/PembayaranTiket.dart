import "package:flutter/material.dart";
import "package:gohealing/User/pages/Detail/Tiket/DetalTiketPage.dart";
import 'package:gohealing/User/dummyData/DBmetodePemabayaran.dart';
import 'package:intl/intl.dart';

class PembayaranTiket extends StatefulWidget {
  final Map<String, dynamic>? tempatWisataData;

  const PembayaranTiket({super.key, required this.tempatWisataData});

  @override
  State<PembayaranTiket> createState() => _PembayaranTiketState();
}

class _PembayaranTiketState extends State<PembayaranTiket> {
  int count = 0;
  int selectedIdx = -1;

  void increment() {
    setState(() {
      count = (count + 1).clamp(0, 999); // Batasan maksimal 999
    });
  }

  void decrement() {
    setState(() {
      count = (count - 1).clamp(0, 999); // Batasan minimal 0
    });
  }

  @override
  Widget build(BuildContext context) {
    String formatNomor(String nomor) {
      String formattedNomor = nomor.replaceAllMapped(
        RegExp(r".{4}"),
        (Match match) => "${match.group(0)}-",
      );

      // Menghilangkan tanda "-" ekstra di akhir jika ada
      if (formattedNomor.endsWith("-")) {
        formattedNomor = formattedNomor.substring(0, formattedNomor.length - 1);
      }

      return formattedNomor;
    }

// format number
    String formatNumber(int number) {
      String formattedNumber = number.toString().replaceAllMapped(
            RegExp(r".{3}"),
            (Match match) => "${match.group(0)}.",
          );

      // Menghilangkan tanda "." ekstra di akhir jika ada
      if (formattedNumber.endsWith(".")) {
        formattedNumber =
            formattedNumber.substring(0, formattedNumber.length - 1);
      }

      return formattedNumber;
    }

// Mendapatkan nilai dari key "tempatWisata" dalam widget.tempatWisataData
    String tempatWisata = widget.tempatWisataData?["tempatWisata"] ??
        ""; // Menggunakan null-aware operator dan default value ""

// Menghitung jumlah huruf dalam string
    int jumlahHuruf = tempatWisata.length;

    double tinggi = (jumlahHuruf <= 15) ? 140.0 : 170.0;

    int harga =
        int.parse(widget.tempatWisataData?['harga'].replaceAll('.', ''));

    int total = harga * count;
    String formattedTotal = formatNumber(total);

    // String harga = widget.tempatWisataData?['harga'];
    double width = (harga <= 9999)
        ? 60.0
        : (harga < 99999)
            ? 75.0
            : (harga < 999999)
                ? 55.0
                : 30.0;
    return Scaffold(
      appBar: AppBar(
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
        title: Text("Pembayaran"),
        // ABIS PAGE INI, BAKALAN NGARAH KE DETAIL TIKET PAK LEWAT TOMBOL INI
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: 10,
            left: MediaQuery.of(context).size.width * (0.06),
            right: MediaQuery.of(context).size.width * (0.06)),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * (0.86),
              height: tinggi,
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
                          widget.tempatWisataData?["gambar"],
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
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * (0.4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.tempatWisataData?["tempatWisata"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  widget.tempatWisataData?['lokasi'],
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue,
                                  ),
                                  height: 30,
                                  width: 35,
                                  child: Center(
                                    child: IconButton(
                                      padding: EdgeInsets.only(bottom: 3),
                                      onPressed: () {
                                        decrement();
                                        print(
                                            "Jumlah huruf dalam tempat wisata: $jumlahHuruf");
                                        print(harga);
                                        print(width);
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    count.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue,
                                  ),
                                  height: 30,
                                  width: 35,
                                  child: Center(
                                    child: IconButton(
                                      padding: EdgeInsets.only(bottom: 3),
                                      onPressed: () {
                                        increment();
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: width,
                                ),
                                Container(
                                  child: Text(
                                    'Rp ${widget.tempatWisataData?['harga']}',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
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
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * (0.86),
              height: 240,
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
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, right: 10, bottom: 10, left: 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Metode Pembayaran',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIdx = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                      color: selectedIdx == index
                                          ? Colors.blue
                                          : Colors.white,
                                      width: 5.0),
                                ),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.only(top: 5),
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        items[index].jenis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                          ' ${formatNomor((items[index].nomor).toString())}'),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedIdx = index;
                                      });
                                    },
                                    icon: Icon(
                                      selectedIdx == index
                                          ? Icons.circle_rounded
                                          : Icons.circle_outlined,
                                      color: selectedIdx == index
                                          ? Colors.blue
                                          : null,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionalTranslation(
                translation: Offset(0.0, 2.0),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * (0.86),
                        height: 60,
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
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 5, right: 10, bottom: 5, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Pesanan',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                'Rp ${formatNumber(total)}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: (count != 0 && selectedIdx != -1)
                                  ? Colors.blue
                                  : Colors.grey),
                          onPressed: (count != 0 && selectedIdx != -1)
                              ? () {
                                  print('Klik Beli');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailTiketPage(),
                                    ),
                                  );
                                  // Aksi yang diambil ketika tombol diklik
                                }
                              : null,
                          child: Text(
                            'Beli Tiket',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
