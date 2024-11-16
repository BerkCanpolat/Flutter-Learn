import 'package:flutter/material.dart';
import 'package:flutter_architecture_v2/product/utility/constants/project_radius.dart';

/// radius is 20
final class NormalButton extends StatelessWidget {
  const NormalButton({super.key, required this.title, required this.onPressed});

  /// title text
  final String title;

  /// button on pressed
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      /// todo:
      radius: ProjectRadius.normal.value,
      child: Text(title),
    );
  }
}