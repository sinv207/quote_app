// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;

  const User({
    required this.name,
    required this.id,
  });

  User copyWith({
    String? name,
    String? id,
  }) {
    return User(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  String toJson() => json.encode(<String, dynamic>{
        'name': name,
        'id': id,
      });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String,
        id: json['id'] as String,
      );

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, id];
}
