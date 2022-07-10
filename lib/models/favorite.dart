// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:quote_app/models/quote.dart';

class Favorite extends Equatable {
  final String id; // format: userId_quoteId
  final bool isFavorite;
  final String user;

  const Favorite({
    required this.id,
    required this.user,
    required this.isFavorite,
  });

  String get userId => id.split('_').first;
  String get quoteId => id.split('_').last;

  Favorite copyWith({
    String? id,
    String? user,
    bool? isFavorite,
  }) {
    return Favorite(
      id: id ?? this.id,
      user: user ?? this.user,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'is_favorite': isFavorite,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      id: map['id'] as String,
      user: map['user'] as String,
      isFavorite: map['is_favorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) =>
      Favorite.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, isFavorite];
}
