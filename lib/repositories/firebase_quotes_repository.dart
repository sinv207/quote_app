import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quote_app/models/favorite.dart';
import 'package:quote_app/models/models.dart';

import 'quotes_repository.dart';

class FirebaseQuotesRepository implements QuotesRepository {
  // final todoCollection = Firestore.instance.collection('todos');
  final _quotesCollection = FirebaseFirestore.instance.collection('quotes');
  final _favoritesCollection =
      FirebaseFirestore.instance.collection('favorites');

  final User _user;

  FirebaseQuotesRepository({required User user}) : _user = user;

  @override
  Stream<List<Quote>> quotes() {
    return _quotesCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Quote.fromJson(doc.data()..addAll({'id': doc.id})))
          .toList();
    });
  }

  @override
  Future<void> updateFavorite(String quoteId, bool flag) async {
    _favoritesCollection
        .doc('${_user.id}_$quoteId')
        .set({'is_favorite': flag, 'user': _user.id});
  }

  @override
  Future<List<String>> fetchFavoriteIds() async {
    throw UnimplementedError();
    // TODO: unused
    // QuerySnapshot<Map<String, dynamic>> snapshot =
    //     await _favoritesCollection.where('user', isEqualTo: _user.id).get();
    // return snapshot.docs
    //     .map((doc) =>
    //         Favorite.fromMap(doc.data()..addAll({'id': doc.id})).quoteId)
    //     .toList();
  }

  @override
  Future<List<Favorite>> fetchFavorites() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _favoritesCollection.where('user', isEqualTo: _user.id).get();
    return snapshot.docs
        .map((doc) => Favorite.fromMap(doc.data()..addAll({'id': doc.id})))
        .toList();
  }
}
