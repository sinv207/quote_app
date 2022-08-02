// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteTheme extends Equatable {
  final String image;
  final String font;
  final double size;
  final String color;

  const QuoteTheme({
    required this.image,
    required this.font,
    required this.size,
    required this.color,
  });

  Color _getColor() =>
      Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);

  // String get fontFamily => GoogleFonts.getFont(font).fontFamily ?? font;

  TextStyle? getStyle(TextStyle? defaultStyle) {
    try {
      return GoogleFonts.getFont(
        font,
        textStyle: defaultStyle,
        fontSize: size,
        color: _getColor(),
      );
    } catch (err) {
      return defaultStyle?.copyWith(
        fontFamily: font,
        fontSize: size,
        color: _getColor(),
      );
    }
  }

  static QuoteTheme initial = const QuoteTheme(
    image: '',
    font: '',
    size: 30,
    color: '#ffffff',
  );

  QuoteTheme copyWith({
    String? image,
    String? font,
    double? size,
    String? color,
  }) {
    return QuoteTheme(
      image: image ?? this.image,
      font: font ?? this.font,
      size: size ?? this.size,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'font': font,
      'size': size,
      'color': color,
    };
  }

  factory QuoteTheme.fromMap(Map<String, dynamic> map) {
    return QuoteTheme(
      image: map['image'] as String,
      font: map['font'] as String,
      size: map['size'] as double,
      color: map['color'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuoteTheme.fromJson(String source) =>
      QuoteTheme.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [image, font, size, color];
}
