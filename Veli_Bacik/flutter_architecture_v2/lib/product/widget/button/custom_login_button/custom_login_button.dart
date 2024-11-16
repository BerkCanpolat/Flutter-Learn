import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_v2/product/utility/mixin/mounted_mixin.dart';
import 'package:flutter_architecture_v2/product/widget/button/normal_button.dart';

part 'custom_login_button_mixin.dart';

final class CustomLoginButton extends StatefulWidget {
  const CustomLoginButton({super.key, required this.onOperation});
  final AsyncValueGetter<bool> onOperation;

  @override
  State<CustomLoginButton> createState() => _CustomLoginButtonState();
}

class _CustomLoginButtonState extends State<CustomLoginButton> with MountedMixin, _CustomLoginButtonMixin{
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoadingNorifier, 
      builder: (context, value, child) {
        if(value) return const SizedBox();
        return NormalButton(title: 'Login', onPressed: () async {
          await _onPressed(context);
        });
      },
     );    
  }
}