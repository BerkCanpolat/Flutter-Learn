/// Project service path
enum ProductServicePath {
  userV1('user'),
  posts('posts'),
  usersV2('v2/users');

  final String value;
  const ProductServicePath(this.value);

  /// [withQuery] is add query to path
  /// 
  /// Example: users/123
  String withQuery() {
    return '${this.value}/value';
  }


}