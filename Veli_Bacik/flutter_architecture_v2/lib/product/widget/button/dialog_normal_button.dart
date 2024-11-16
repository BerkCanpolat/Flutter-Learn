import 'package:flutter/material.dart';
import 'package:flutter_architecture_v2/product/widget/button/normal_button.dart';

class DialogNormalButton extends StatelessWidget {
  const DialogNormalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      title: 'title', 
      onPressed: (){
        /// Show Dialog
      }
    );
  }
}