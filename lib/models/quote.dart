import 'dart:convert';

import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  const Quote(
      {required this.id,
      required this.text,
      required this.author,
      bool? isFavorite})
      : isFavorite = isFavorite ?? false;

  final String id;
  final String text;
  final String author;
  final bool isFavorite;

  Quote copyWith({String? text, String? author, bool? isFavorite}) {
    return Quote(
      id: id,
      text: text ?? this.text,
      author: author ?? this.author,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quote': text,
      'author': author,
    };
  }

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      text: json['text'],
      author: json['author'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Quote(quote: $text, author: $author)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Quote && o.text == text && o.author == author;
  }

  @override
  int get hashCode => text.hashCode ^ author.hashCode;

  @override
  List<Object> get props => [id, text, author];
}
