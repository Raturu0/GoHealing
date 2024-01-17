// File: DBWisata.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class DBorder {
  final CollectionReference _orderCollection =
      FirebaseFirestore.instance.collection('DB_order');

  Stream<QuerySnapshot<Map<String, dynamic>>> getWisataStream() {
    return _orderCollection.snapshots().map(
          (QuerySnapshot<Object?> querySnapshot) =>
              querySnapshot as QuerySnapshot<Map<String, dynamic>>,
        );
  }
}
