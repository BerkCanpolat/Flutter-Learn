void main() {
  final user = UserGeneric(data: 1);
  user.data;
  final adminUser = AdminUser();
  removeUserAll(adminUser);
}
void removeUserAll<T extends IAdmin>(T data) {
  data.removeUser();
}
class UserGeneric<T> {
  T data;
  UserGeneric({required this.data});
}

abstract class IAdmin {
  void removeUser();
}

class AdminUser extends IAdmin {
  @override
  void removeUser() {
    // TODO: implement removeUser
  }

}