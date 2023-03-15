import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class Flashcard {
  const Flashcard({
    required this.id,
    required this.uid,
    required this.title,
    required this.isPinned,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String uid;
  final String title;
  final bool isPinned;
  final DateTime createdAt;
  final DateTime updatedAt;

  Flashcard.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as String,
          uid: json['uid']! as String,
          title: json['title']! as String,
          isPinned: json['isPinned'] as bool? ?? false,
          createdAt: (json['createdAt']! as Timestamp).toDate(),
          updatedAt: (json['updatedAt']! as Timestamp).toDate(),
        );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'uid': uid,
      'title': title,
      'isPinned': isPinned,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  Flashcard copyWith(
      {String? id,
      String? uid,
      String? title,
      bool? isPinned,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return Flashcard(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      isPinned: isPinned ?? this.isPinned,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Flashcard &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          id == other.id;

  @override
  int get hashCode => title.hashCode ^ id.hashCode;
}
