import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class Flashcard {
  final String id;
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Flashcard({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  Flashcard.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as String,
          title: json['userName']! as String,
          createdAt: (json['createdAt']! as Timestamp).toDate(),
          updatedAt: (json['updatedAt']! as Timestamp).toDate(),
        );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  Flashcard copyWith(
      {String? id, String? title, DateTime? createdAt, DateTime? updatedAt}) {
    return Flashcard(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

// part 'flashcard.freezed.dart';
// part 'flashcard.g.dart';
//
// @freezed
// class Flashcard with _$Flashcard {
//   factory Flashcard({
//     required String id,
//     required String title,
//     required DateTime createdAt,
//     required DateTime updateAt,
//   }) = _Flashcard;
//
//   factory Flashcard.fromJson(Map<String, dynamic> json) =>
//       _$FlashcardFromJson(json);
// }
