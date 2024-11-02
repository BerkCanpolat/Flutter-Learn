import 'package:flutter_test/flutter_test.dart';

main() {
  // Daha unite teste starta bastığımızda çalışmadan önceki yerdir.
  setUp(() {
    print('Here');
  });

  test("User Login Fail Test", () {
    final isUserLogin = true;

    expect(isUserLogin, isTrue);
  });

  group("User Login Full Test", () {
    //MARK: Test 1
    test("User Login Fail Test", () {
      final isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    //MARK: Test 2
    test("User Login Fail Test", () {
      final isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    //MARK: Test 3
  });
}
