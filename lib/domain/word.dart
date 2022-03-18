import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class Word {
  const Word({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Word.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as String,
          name: json['name']! as String,
          description: json['description']! as String,
          createdAt: (json['createdAt']! as Timestamp).toDate(),
          updatedAt: (json['updatedAt']! as Timestamp).toDate(),
        );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  Word copyWith(
      {String? id,
      String? name,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return Word(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
