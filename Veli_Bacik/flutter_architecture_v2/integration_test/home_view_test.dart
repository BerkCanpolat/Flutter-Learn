// // example/integration_test/example_test.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:patrol/patrol.dart';
// import '../lib/main.dart' as app;

// void main() {
//   patrolTest(
//     'Open home page and press button',
//     ($) async {
//       await app.main();
//       await $.pumpAndSettle();
//       await $(FloatingActionButton).tap();
//       await $.pumpAndSettle();
//       await $('1').waitUntilVisible();
//       $(Scrollable).containing(Text);
//       expect($('rerum'), findsOneWidget);
//     },
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../lib/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Open home page and press button',
    (WidgetTester tester) async {
      await app.main();
      await tester.pumpAndSettle();

      // FloatingActionButton'a bas
      final fab = find.byType(FloatingActionButton);
      expect(fab, findsWidgets);
      await tester.tap(fab);
      await tester.pumpAndSettle();

      // "1" metni görünüyor mu kontrol et
      final textFinder = find.text('1');
      expect(textFinder, findsWidgets);
    },
  );
}
