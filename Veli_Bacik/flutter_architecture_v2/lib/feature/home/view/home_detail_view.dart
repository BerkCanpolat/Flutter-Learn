import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(deferredLoading: false)
final class HomeDetailView extends StatelessWidget {
  const HomeDetailView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}