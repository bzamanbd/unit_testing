import 'dart:convert';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String website;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.website,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? website,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      website: website ?? this.website,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'website': website});
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      website: map['website'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, website: $website)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.website == website;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ website.hashCode;
  }
}
