import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gohealing/User/BottomConvexBarr/BottomConvexBarr.dart';
import 'package:gohealing/User/pages/LoginPage/LoginPage.dart';
import 'package:gohealing/User/widgets/Card/WidgetCardSouvenir.dart';
import 'package:gohealing/User/widgets/Card/WidgetCardWisata.dart';

class DevSouvenirPage extends StatefulWidget {
  @override
  _DevSouvenirPageState createState() => _DevSouvenirPageState();
}

class _DevSouvenirPageState extends State<DevSouvenirPage> {
  TextEditingController judulController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController gambarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "DEV SOUVENIR PAGE",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomConvexBarr(),
                    ));
              },
              icon: Icon(
                Icons.logout,
                color: Colors.amber[900],
              ))
        ],
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream:
            FirebaseFirestore.instance.collection("DB_souvenir").snapshots(),
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
                title: WidgetCardSouvenir(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  judulSouvenir:
                      _data[index].data()?["judulSouvenir"].toString() ?? "",
                  harga: _data[index].data()?["harga"].toString() ?? "",
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
                title: Text("Tambah Data Souvenir"),
                content: Container(
                  width: double.maxFinite,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      TextField(
                        controller: judulController,
                        decoration: InputDecoration(labelText: 'Nama Souvenir'),
                      ),
                      TextField(
                        controller: hargaController,
                        decoration: InputDecoration(labelText: 'Harga'),
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
                        "judulSouvenir": judulController.text,
                        "harga": hargaController.text,
                        "gambar": gambarController.text,
                      };

                      FirebaseFirestore.instance
                          .collection("DB_souvenir")
                          .add(wisata)
                          .then((DocumentReference doc) => print(
                              'DocumentSnapshot added with ID: ${doc.id}'));

                      // Membersihkan nilai di kontroler setelah ditambahkan
                      judulController.clear();
                      hargaController.clear();
                      gambarController.clear();

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
