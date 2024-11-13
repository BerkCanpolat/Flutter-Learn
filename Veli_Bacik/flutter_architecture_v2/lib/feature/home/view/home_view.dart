import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_v2/product/init/config/app_environment.dart';
import 'package:flutter_architecture_v2/product/init/language/locale_keys.g.dart';
import 'package:flutter_architecture_v2/product/init/product_localization.dart';
import 'package:flutter_architecture_v2/product/navigation/app_router.dart';
import 'package:flutter_architecture_v2/product/utility/constants/enums/locales.dart';
import 'package:flutter_architecture_v2/product/widget/project_network_image.dart';
import 'package:gen/gen.dart';

part 'widget/home_app_bar.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Assets.icons.icLove.svg(package: 'gen'),
            ProjectNetworkImage(url: 'https://picsum.photos/250?image=9'),
            //Assets.lottie.animZombie.lottie(package: 'gen'),
            Assets.images.imgFlags.image(package: 'gen'),
            ElevatedButton(onPressed: (){}, child: Text(AppEnvironmentItems.baseUrl.value)),
            const Text('Change Language'),
            ElevatedButton(
              onPressed: (){
                ProductLocalization.updateLanguage(context: context, value: Locales.tr);
              }, 
              child: Text(
                LocaleKeys.general_button_save,
                style: Theme.of(context).textTheme.bodySmall,
                ).tr(),
            ),
            ElevatedButton(onPressed: () async {
              final response = await context.router.push<bool?>(HomeDetailRoute(id: '1'));
            }, child: Text('GİT'))
          ],
        ),
      );
  }
}