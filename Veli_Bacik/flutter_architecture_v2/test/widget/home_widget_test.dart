import 'package:flutter/material.dart';
import 'package:flutter_architecture_v2/feature/home/view/widget/home_user_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';

void main() {
  setUp((){});

  testWidgets('Home User List Test', (tester) async{
    final users = [
      User(id: 1, body: 'body 1'),
      User(id: 2, body: 'body 2'),
      User(id: 3, body: 'body 3'),
    ];

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: HomeUserList(users: users),
      ),
    ));

    for (final item in users) {
      expect(find.text(item.id.toString()), findsOneWidget);
    }
  });
}