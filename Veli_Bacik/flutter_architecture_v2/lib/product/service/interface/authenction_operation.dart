import 'package:gen/gen.dart';

abstract class AuthenctionOperation {
  Future<List<User>> users();
}