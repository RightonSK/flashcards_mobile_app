import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class Word {
  const Word({
    required this.id,
    required this.flashcardId,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String flashcardId;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Word.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as String,
          flashcardId: json['flashcardId']! as String,
          title: json['title']! as String,
          description: json['description']! as String,
          createdAt: (json['createdAt']! as Timestamp).toDate(),
          updatedAt: (json['updatedAt']! as Timestamp).toDate(),
        );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'flashcardId': flashcardId,
      'title': title,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  Word copyWith(
      {String? id,
      String? flashcardId,
      String? title,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return Word(
      id: id ?? this.id,
      flashcardId: flashcardId ?? this.flashcardId,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
