import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_v2/feature/home/view/mixin/home_view_mixin.dart';
import 'package:flutter_architecture_v2/feature/home/view_model/home_view_model.dart';
import 'package:flutter_architecture_v2/feature/home/view_model/state/home_state.dart';
import 'package:flutter_architecture_v2/product/state/base/base_state.dart';
import 'package:flutter_architecture_v2/product/widget/padding/project_padding.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';

part 'widget/home_app_bar.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  //List<User> _users = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        appBar: const _HomeAppBar(),
        body: Padding(
          padding: const ProjectPadding.allNormal() + const EdgeInsets.all(10),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: _UserList(),
              ),
              // BoldTextButton(onPressed: () {}, child: Text('Text Button')),
              // CircleAvatar(
              //   backgroundImage: NetworkImage(''.ext.randomImage),
              // ),
              // Text(
              //   'Berk',
              //   style: context.general.textTheme.titleLarge,
              // ),
              // // Assets.icons.icLove.svg(package: 'gen'),
              // ProjectNetworkImage(url: 'https://picsum.photos/250?image=9'),
              // //Assets.lottie.animZombie.lottie(package: 'gen'),
              // Assets.images.imgFlags.image(package: 'gen'),
              // ElevatedButton(
              //     onPressed: () {},
              //     child: Text(AppEnvironmentItems.baseUrl.value)),
              // const Text('Change Language'),
              // ElevatedButton(
              //   onPressed: () {
              //     ProductLocalization.updateLanguage(
              //         context: context, value: Locales.tr);
              //   },
              //   child: Text(
              //     LocaleKeys.general_button_save,
              //     style: Theme.of(context).textTheme.bodySmall,
              //   ).tr(),
              // ),
              // ElevatedButton(
              //     onPressed: () async {
              //       final response = await context.router
              //           .push<bool?>(HomeDetailRoute(id: '1'));
              //     },
              //     child: Text('GİT')),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          //homeViewModel.changeLoading();
          productViewModel.changeThemeMode(ThemeMode.dark);
          await homeViewModel.fetchUsers();
          //_users = await loginService.users();
          //setState(() {});
        }),
      ),
    );
  }
}

final class _UserList extends StatelessWidget {
  const _UserList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeViewModel, HomeState>(
      listener: (context, state) {
       print(state.users);
      },
      child: BlocSelector<HomeViewModel, HomeState, List<User>>(
        selector: (state) {
          return state.users ?? [];
        },
        builder: (context, state) {
          if (state.isEmpty) return const SizedBox.shrink();
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state[index].title ?? ''),
                subtitle: Text(state[index].body ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
