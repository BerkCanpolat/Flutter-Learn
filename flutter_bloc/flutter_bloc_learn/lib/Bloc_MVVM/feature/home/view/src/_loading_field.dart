part of '../home_view.dart';

class _LoadingField extends StatelessWidget {
  const _LoadingField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(),);
  }
}