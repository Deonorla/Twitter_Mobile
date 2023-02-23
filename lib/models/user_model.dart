import 'package:flutter/foundation.dart';

@immutable
class UserModel {
  //Note:  we are not adding password beause we want the password to be encrypted.
  final String email;
  final String name;
  final List<String> followers;
  final List<String> following;
  final String profilePicture;
  final String bannerPic;
  final String uid;
  final String bio;
  final bool isTwitterBlue;

  const UserModel({
    required this.email,
    required this.name,
    required this.followers,
    required this.following,
    required this.profilePicture,
    required this.bannerPic,
    required this.uid,
    required this.bio,
    required this.isTwitterBlue,
  });

  UserModel copyWith({
    String? email,
    String? name,
    List<String>? followers,
    List<String>? following,
    String? profilePicture,
    String? bannerPic,
    String? uid,
    String? bio,
    bool? isTwitterBlue,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      profilePicture: profilePicture ?? this.profilePicture,
      bannerPic: bannerPic ?? this.bannerPic,
      uid: uid ?? this.uid,
      bio: bio ?? this.bio,
      isTwitterBlue: isTwitterBlue ?? this.isTwitterBlue,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'followers': followers});
    result.addAll({'following': following});
    result.addAll({'profilePicture': profilePicture});
    result.addAll({'bannerPic': bannerPic});
    result.addAll({'bio': bio});
    result.addAll({'isTwitterBlue': isTwitterBlue});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      name: map['name'] as String,
      followers: List<String>.from(map['followers'] as List<dynamic>),
      following: List<String>.from(map['following'] as List<dynamic>),
      profilePicture: map['profilePicture'] as String,
      bannerPic: map['bannerPic'] as String,
      uid: map['\$id'] as String,
      bio: map['bio'] as String,
      isTwitterBlue: map['isTwitterBlue'] as bool,
    );
  }

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, followers: $followers, following: $following, profilePicture: $profilePicture, bannerPic: $bannerPic, uid: $uid, bio: $bio, isTwitterBlue: $isTwitterBlue)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.name == name &&
        listEquals(other.followers, followers) &&
        listEquals(other.following, following) &&
        other.profilePicture == profilePicture &&
        other.bannerPic == bannerPic &&
        other.uid == uid &&
        other.bio == bio &&
        other.isTwitterBlue == isTwitterBlue;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        name.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        profilePicture.hashCode ^
        bannerPic.hashCode ^
        uid.hashCode ^
        bio.hashCode ^
        isTwitterBlue.hashCode;
  }
}
