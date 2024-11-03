import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/state/base_state.dart';
import 'package:flutter_architecture/core/base/view/base_widget.dart';
import 'package:flutter_architecture/view/authenticate/test/viewmodel/test_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  late TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(), 
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: (context, value) => Text('data'),
    );
  }

  Widget get scaffoldBody => Scaffold(
    floatingActionButton: floatingActionButtonNumberIncrement,
    body: textNumber,
  );

  FloatingActionButton get floatingActionButtonNumberIncrement => FloatingActionButton(onPressed: () => viewModel.incrementNumber);

  Widget get textNumber => Observer(builder: (context) => Text(viewModel.number.toString()));
}