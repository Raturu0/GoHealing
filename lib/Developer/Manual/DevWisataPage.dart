import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gohealing/User/BottomConvexBarr/BottomConvexBarr.dart';
import 'package:gohealing/User/pages/LoginPage/LoginPage.dart';
import 'package:gohealing/User/widgets/Card/WidgetCardWisata.dart';

class DevWisataPage extends StatefulWidget {
  @override
  _DevWisataPageState createState() => _DevWisataPageState();
}

class _DevWisataPageState extends State<DevWisataPage> {
  TextEditingController tempatController = TextEditingController();
  TextEditingController lokasiController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController jarakController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController gambarController = TextEditingController();
  TextEditingController reviewsController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "DEV WISATA PAGE",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:  (context) => BottomConvexBarr(),));
        }, icon: Icon(Icons.logout, color: Colors.amber[900],))],
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("DB_wisata").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var _data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) {
              return ListTile(
                onLongPress: () {
                  _data[index].reference.delete().then((value) =>
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Data removed"))));
                },
                title: WidgetCardWisata(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  namaTempat:
                      _data[index].data()?["tempatWisata"].toString() ?? "",
                  lokasi: _data[index].data()?["lokasi"].toString() ?? "",
                  harga: _data[index].data()?["harga"].toString() ?? "",
                  jarak: _data[index].data()?["jarak"].toString() ?? "",
                  rating: _data[index].data()?["rating"].toString() ?? "",
                  gambar: _data[index].data()?["gambar"].toString() ?? "",
                ),
                subtitle: SizedBox(height: 20),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Tambah Data Wisata"),
                content: Container(
                  width: double.maxFinite,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      TextField(
                        controller: tempatController,
                        decoration: InputDecoration(labelText: 'Tempat Wisata'),
                        maxLength: 18,
                      ),
                      TextField(
                        controller: lokasiController,
                        decoration: InputDecoration(labelText: 'Lokasi'),
                      ),
                      TextField(
                        controller: ratingController,
                        decoration: InputDecoration(labelText: 'Rating'),
                      ),
                      TextField(
                        controller: jarakController,
                        decoration: InputDecoration(labelText: 'Jarak'),
                      ),
                      TextField(
                        controller: hargaController,
                        decoration: InputDecoration(labelText: 'Harga'),
                      ),
                      TextField(
                        controller: reviewsController,
                        decoration: InputDecoration(labelText: 'Reviews'),
                      ),
                      TextField(
                        controller: deskripsiController,
                        decoration: InputDecoration(labelText: 'Deskripsi'),
                      ),
                      TextField(
                        controller: gambarController,
                        decoration: InputDecoration(labelText: 'URL Gambar'),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Batal"),
                  ),
                  TextButton(
                    onPressed: () {
                      final wisata = <String, dynamic>{
                        "tempatWisata": tempatController.text,
                        "lokasi": lokasiController.text,
                        "rating": int.parse(ratingController.text),
                        "jarak": jarakController.text,
                        "harga": hargaController.text,
                        "gambar": gambarController.text,
                        "reviews": reviewsController.text,
                        "deskripsi": deskripsiController.text,
                      };

                      FirebaseFirestore.instance
                          .collection("DB_wisata")
                          .add(wisata)
                          .then((DocumentReference doc) =>
                              print('DocumentSnapshot added with ID: ${doc.id}'));

                      // Membersihkan nilai di kontroler setelah ditambahkan
                      tempatController.clear();
                      lokasiController.clear();
                      ratingController.clear();
                      jarakController.clear();
                      hargaController.clear();
                      gambarController.clear();
                      reviewsController.clear();
                      deskripsiController.clear();

                      Navigator.pop(context);
                    },
                    child: Text("Tambah"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
