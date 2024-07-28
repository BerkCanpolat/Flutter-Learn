import 'package:flutter/material.dart';

class PasswordTextFieldDemos extends StatefulWidget {
  const PasswordTextFieldDemos({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<PasswordTextFieldDemos> createState() => _PasswordTextFieldDemosState();
}

class _PasswordTextFieldDemosState extends State<PasswordTextFieldDemos> {
  final _obsureText = '#';
  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      obscureText: _isSecure,
      obscuringCharacter: _obsureText,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: 'Password',
        suffix: _visibilityIcon(),
      ),
    );
  }

  IconButton _visibilityIcon() {
    return IconButton(onPressed: (){
        _changeLoading();
      }, 
      icon: AnimatedCrossFade(
        firstChild: Icon(Icons.visibility_outlined), 
        secondChild: Icon(Icons.visibility_off_outlined), 
        crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond, 
        duration: Duration(seconds: 1))
      );
      //icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off,));
  }
}