import 'dart:convert';

UserDetails userDetailsFromJson(String str) => UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  String status;
  String message;
  Data data;

  UserDetails({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String firstName;
  String lastName;
  String email;
  String gender;
  String phone;
  String avatar;
  int earnings;
  String role;
  String status;
  String isVerified;
  DateTime joinedAt;
  String ratings;
  String bio;

  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phone,
    required this.avatar,
    required this.earnings,
    required this.role,
    required this.status,
    required this.isVerified,
    required this.joinedAt,
    required this.ratings,
    required this.bio,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    gender: json["gender"],
    phone: json["phone"],
    avatar: json["avatar"],
    earnings: json["earnings"],
    role: json["role"],
    status: json["status"],
    isVerified: json["is_verified"],
    joinedAt: DateTime.parse(json["joined_at"]),
    ratings: json["ratings"],
    bio: json["bio"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "gender": gender,
    "phone": phone,
    "avatar": avatar,
    "earnings": earnings,
    "role": role,
    "status": status,
    "is_verified": isVerified,
    "joined_at": joinedAt.toIso8601String(),
    "ratings": ratings,
    "bio": bio,
  };
}
