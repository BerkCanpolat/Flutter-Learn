import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/constant/duration_items.dart';
import 'package:flutter_full_learn/product/constant/lottie_items.dart';
import 'package:lottie/lottie.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}
//https://lottie.host/21f4747a-bbe3-4998-aa12-6a1565e51d7e/xabxad6krV.json
//https://lottie.host/616db15f-0a2c-49c4-93ca-9929d01165b1/1OuvKmtHtI.json
class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin{
  late AnimationController controller;
  bool isLight = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: DurationItems.durationNormal());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {

              controller.animateTo(isLight ? 0.0 : 0.9);
              isLight = !isLight;
              //controller.animateTo(0.9);
            },
            child: Lottie.asset(
              LottieItems.themeChange.lottiePath,
              repeat: false,
              controller: controller
            ),
          ),
        ],
      ),
      body: LoadingLottie(),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    super.key,
  });
  final _loadingLottie = 'https://lottie.host/616db15f-0a2c-49c4-93ca-9929d01165b1/1OuvKmtHtI.json';

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(_loadingLottie));
  }
}

