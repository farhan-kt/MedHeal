class UserModel {
  String? uId;
  String? userName;
  String? email;
  String? phoneNumber;

  UserModel({
    required this.uId,
    required this.userName,
    required this.email,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uId: json['userId'],
        userName: json['name'],
        email: json['email'],
        phoneNumber: json['phoneNumber']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': uId,
      'name': userName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
