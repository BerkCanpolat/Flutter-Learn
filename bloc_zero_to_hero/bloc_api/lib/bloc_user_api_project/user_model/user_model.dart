class UserModel {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;
  UserModel({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String,dynamic> json) {
    return UserModel(
      id: json['id'], 
      email: json['email'], 
      first_name: json['first_name'] ?? 'First Name', 
      last_name: json['last_name'] ?? 'Last Name', 
      avatar: json['avatar'] ??
      'https://img.freepik.com/premium-vector/man-with-shirt-that-says-d-it_704913-37100.jpg?w=1380'
    );
  }
}

class UserDataModel {
  final List<UserModel> data;

  UserDataModel({required this.data});

  factory UserDataModel.fromJson(Map<String,dynamic> json) {
    final userData = json['data'] as List;
    return UserDataModel(
      data: userData.map((e) => UserModel.fromJson(e)).toList(),
    );
  }
}