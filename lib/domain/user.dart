import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class User {
  const User({
    required this.uid,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  final String uid;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;

  User.fromJson(Map<String, Object?> json)
      : this(
          uid: json['uid']! as String,
          email: json['email']! as String,
          createdAt: (json['createdAt']! as Timestamp).toDate(),
          updatedAt: (json['updatedAt']! as Timestamp).toDate(),
        );

  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'email': email,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  User copyWith(
      {String? uid, String? email, DateTime? createdAt, DateTime? updatedAt}) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
