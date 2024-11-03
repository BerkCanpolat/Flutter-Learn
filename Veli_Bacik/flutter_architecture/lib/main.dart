import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/constants/app/app_constants.dart';
import 'package:flutter_architecture/core/init/lang/lang_manager.dart';
import 'package:flutter_architecture/core/init/notifier/provider_list.dart';
import 'package:flutter_architecture/core/init/notifier/theme_notifier.dart';
import 'package:flutter_architecture/view/authenticate/test/view/test_view.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ...ApplicationProvider.instance.dependItems
    ],
    child: EasyLocalization(child: MyApp(),
    supportedLocales: LanguageManager.instance.supportedLocales, 
    path: ApplicationConstants.LANG_ASSET_PATH,
    //fallbackLocale: LanguageManager.instance.enLocale,
    startLocale: LanguageManager.instance.trLocale,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifier>().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: TestView()
    );
  }
}