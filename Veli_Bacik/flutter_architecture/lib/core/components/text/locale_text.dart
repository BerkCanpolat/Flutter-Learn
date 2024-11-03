import 'package:flutter/widgets.dart';
import 'package:flutter_architecture/core/extension/string_extension.dart';

class LocaleText extends StatelessWidget {
  final String value;
  const LocaleText({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(value.locale);
  }
}