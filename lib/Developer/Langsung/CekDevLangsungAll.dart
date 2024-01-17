import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DevAllLangsungOrder extends StatelessWidget {
  // Fungsi untuk menambahkan banyak data sekaligus
  Future<void> _addMultipleData() async {
    final List<Map<String, dynamic>> dataToAdd = [
      {
        "nama" : "ahmad",
        "tempat" : "boyolali"
      },
      {
        "nama" : "ahmad",
        "tempat" : "boyolali"
      }
    ];

    for (final Map<String, dynamic> data in dataToAdd) {
      await FirebaseFirestore.instance.collection("DB_order").add(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FIREBASE - ORDER"),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("DB_order").snapshots(),
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
                title: Column(
                  children: [
                    Image.network(
                      _data[index].data()?["gambar"].toString() ?? "",
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8.0),
                    Text("${_data[index].data()?["nama"].toString() ?? ""} -- " +
                        "${_data[index].data()?["kode"].toString() ?? ""} -- + "
                            "${_data[index].data()?["harga"].toString() ?? ""} -- + "
                            "${_data[index].data()?["berlakuSampaiTanggal"].toString() ?? ""} -- + "
                            "${_data[index].data()?["estimasiSampai"].toString() ?? ""} -- + "
                            "${_data[index].data()?["jam"].toString() ?? ""} -- + "
                            "${_data[index].data()?["status"].toString() ?? ""} -- + "),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addMultipleData(); // Panggil fungsi untuk menambahkan banyak data
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
