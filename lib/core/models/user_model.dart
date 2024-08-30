import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:harmoniz/features/home/model/fav_song_model.dart';

class UserModel {
  final String name;
  final String email;
  final String id;
  final String token;
  final List<FavSongModel> favorites;

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.token,
    required this.favorites,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? id,
    String? token,
    List<FavSongModel>? favorites,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      token: token ?? this.token,
      favorites: favorites ?? this.favorites,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'id': id});
    result.addAll({'token': token});
    result.addAll({'favorites': favorites.map((x) => x.toMap()).toList()});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      id: map['id'] ?? '',
      token: map['token'] ?? '',
      favorites: List<FavSongModel>.from(
        (map['favorites'] ?? []).map(
          (x) => FavSongModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, id: $id, token: $token, favorites: $favorites)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.email == email &&
        other.id == id &&
        other.token == token &&
        listEquals(other.favorites, favorites);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        id.hashCode ^
        token.hashCode ^
        favorites.hashCode;
  }
}
