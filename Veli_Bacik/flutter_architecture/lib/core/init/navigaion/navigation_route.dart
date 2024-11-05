import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/components/card/not_found_navigation.dart';
import 'package:flutter_architecture/core/constants/navigaton/navigation_constants.dart';
import 'package:flutter_architecture/view/authenticate/test/view/test_view.dart';

class NavigationRoute {
      static NavigationRoute? _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance!;
    //_instance ??= NavigationService._init();
    //return _instance!;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch(args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestView());
      default:
        return MaterialPageRoute(builder: (context) => const NotFoundNavigationWidget()
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}