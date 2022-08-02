import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quote_app/models/quote_theme.dart';
import 'package:quote_app/repositories/themes_repository.dart';

class FirebaseThemesRepository extends ThemesRepository {
  final _themesCollection = FirebaseFirestore.instance.collection('themes');
  @override
  Future<List<QuoteTheme>> fetchThemes() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _themesCollection.get();
    return snapshot.docs.map((doc) => QuoteTheme.fromMap(doc.data())).toList();
  }

  // @override
  // Future<void> updateThemes() async {
  //   // Get a new write batch
  //   final batch = FirebaseFirestore.instance.batch();
  //   for (var item in themes) {
  //     // Set the value of 'NYC'
  //     var doccRef = _themesCollection.doc(); //automatically generate unique id
  //     batch.set(doccRef, item.toMap());
  //   }
  //   // Commit the batch
  //   batch.commit().then((_) {
  //     // ...
  //   });
  // }
}
