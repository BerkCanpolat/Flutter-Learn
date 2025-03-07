import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

mixin MountedMixin<T extends StatefulWidget> on State<T>{
  Future<void> safeOperation(AsyncCallback callback) async{
    if(!mounted) return;
    callback.call();
  }
}