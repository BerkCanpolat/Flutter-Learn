import 'package:flutter/material.dart';
import 'package:flutter_architecture_v2/product/state/container/product_state_Items.dart';
import 'package:flutter_architecture_v2/product/state/view_model/product_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class StateInitialize extends StatelessWidget {
  const StateInitialize({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductViewModel>.value(value: ProductStateItems.productViewModel)
      ], 
      child: child
    );
  }
}