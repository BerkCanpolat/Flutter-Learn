import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/state/base_state.dart';
import 'package:flutter_architecture/core/base/view/base_widget.dart';
import 'package:flutter_architecture/core/constants/enums/locale_keys_enum.dart';
import 'package:flutter_architecture/core/extension/string_extension.dart';
import 'package:flutter_architecture/core/init/cache/locale_manager.dart';
import 'package:flutter_architecture/core/init/lang/lang_manager.dart';
import 'package:flutter_architecture/core/init/lang/locale_keys.g.dart';
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
      onPageBuilder: (context, value) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
    appBar: AppBar(
      leading: Text(LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)),
      title: textWelcomeWidget(),
    actions: [
      iconButtonChangeTheme()
    ],
    ),
    floatingActionButton: floatingActionButtonNumberIncrement,
    body: textNumber,
  );

  Text textWelcomeWidget() => Text(LocaleKeys.welcome.locale);

  IconButton iconButtonChangeTheme() {
    return IconButton(onPressed: (){
      context.setLocale(LanguageManager.instance.enLocale);
    }, icon: const Icon(Icons.change_circle));
  }

  FloatingActionButton get floatingActionButtonNumberIncrement => FloatingActionButton(onPressed: () => viewModel.incrementNumber());

  Widget get textNumber => Observer(builder: (context) => Center(child: Text(viewModel.number.toString())));
}