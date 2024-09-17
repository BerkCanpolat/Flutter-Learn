import 'package:bloc_clean_architecture_login_api/config/color/colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final double height;
  final VoidCallback onPress;
  const RoundButton({super.key, required this.title, this.height = 40, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.buttonColor
        ),
        child: Center(child: Text(title),),
      ),
    );
  }
}