import 'package:flutter/widgets.dart';
import 'package:flutter_architecture/core/init/navigaion/INavigationService.dart';

class NavigationService implements Inavigationservice {
    static NavigationService? _instance = NavigationService._init();
  static NavigationService get instance => _instance!;
    //_instance ??= NavigationService._init();
    //return _instance!;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  Future<void> navigateToPage({String? path, Object? object}) async {
    await navigatorKey.currentState?.pushNamed(path ?? '', arguments: object);
  }
  
  @override
  Future<void> navigateToPageClear({String? path, Object? object}) async {
    await navigatorKey.currentState?.pushNamedAndRemoveUntil(path ?? '', removeAllOldRoutes, arguments: object);
  }
}