import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

/// HomeUserList Widget
final class HomeUserList extends StatelessWidget {
  const HomeUserList({super.key, required this.users});
  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index].title ?? ''),
          subtitle: Text(users[index].body ?? ''),
          trailing: Text(users[index].id.toString()),
        );
      },
    );
  }
}
