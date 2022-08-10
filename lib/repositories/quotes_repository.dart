import 'dart:async';

import 'package:quote_app/models/favorite.dart';
import 'package:quote_app/models/quote.dart';

abstract class QuotesRepository {
  // Future<void> addNewTodo(Quote quote);

  // Future<void> deleteTodo(Quote quote);

  Stream<List<Quote>> quotes();

  // Future<void> updateTodo(Quote quote);
  // Future<List<Quote>> fetchQuotes();

  Future<void> addNewQuote(Quote quote);

  Future<void> updateFavorite(String quoteId, bool flag);

  Future<List<Favorite>> fetchFavorites();
  Future<List<String>> fetchFavoriteIds();
}
