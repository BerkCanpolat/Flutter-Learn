import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture_v2/product/init/config/app_environment.dart';
import 'package:flutter_architecture_v2/product/state/container/product_state_Items.dart';
import 'package:flutter_architecture_v2/product/state/container/product_state_container.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/web.dart';

@immutable
/// This class is used to initialize the application process
final class ApplicationInitialize {

  /// project basic required initialize
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded<Future<void>>(
      _initialize, 
      (error, stack) {
        Logger().e(error);
      });
  }



  // This method is used to initialize the application process
  Future<void> _initialize() async {
    
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await DeviceUtility.instance.initPackageInfo();

    FlutterError.onError = (details) {
      /// crashlytics log insert here
      /// custom service or custom logger insert here
      /// Todo: add custom logger
      Logger().e(details.exceptionAsString());
    };

    AppEnvironment.general();
    ProductStateContainer.setup();
    ProductStateItems.productCache.init();
    // Dependency initialize
    // Envied
  }
}