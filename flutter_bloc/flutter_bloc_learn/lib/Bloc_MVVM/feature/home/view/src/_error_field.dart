part of '../home_view.dart';

class _ErrorField extends StatelessWidget {
   const _ErrorField({
    required this.error,
  });
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}