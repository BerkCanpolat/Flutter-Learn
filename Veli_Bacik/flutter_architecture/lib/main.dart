import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/constants/app/app_constants.dart';
import 'package:flutter_architecture/core/init/lang/lang_manager.dart';
import 'package:flutter_architecture/view/authenticate/test/view/test_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(child: MyApp(),
  supportedLocales: LanguageManager.instance.supportedLocales, 
  path: ApplicationConstants.LANG_ASSET_PATH,
  //fallbackLocale: LanguageManager.instance.enLocale,
  startLocale: LanguageManager.instance.enLocale,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: TestView()
    );
  }
}