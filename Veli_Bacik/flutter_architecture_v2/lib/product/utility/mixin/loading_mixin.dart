import 'package:flutter/material.dart';

mixin LoadingMixin<T extends StatefulWidget> on State<T>{
  final ValueNotifier<bool> _isLoadingNorifier = ValueNotifier<bool>(false);

  bool get isLoading => _isLoadingNorifier.value;

  ValueNotifier<bool> get isLoadingNorifier => _isLoadingNorifier;

  void updateLoading({bool? isLoading}) {
    if(isLoading != null) _isLoadingNorifier.value = isLoading;

    _isLoadingNorifier.value = !_isLoadingNorifier.value;
  }
}