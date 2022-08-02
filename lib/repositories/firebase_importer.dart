import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Importer {
  static Future<void> doImport(
      String colName, List<Map<String, dynamic>> dataList) async {
    final collectionRef = FirebaseFirestore.instance.collection(colName);
    // Get a new write batch
    final batch = FirebaseFirestore.instance.batch();
    for (var item in dataList) {
      // Set the value of 'NYC'
      var doccRef = collectionRef.doc(); //automatically generate unique id
      batch.set(doccRef, item);
    }
    // Commit the batch
    batch.commit().then((_) {
      // ...
      if (kDebugMode) {
        print("Import successfully");
      }
    });
  }
}
