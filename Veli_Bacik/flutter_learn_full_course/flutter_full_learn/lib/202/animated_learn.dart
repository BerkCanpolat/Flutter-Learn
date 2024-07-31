import 'package:flutter/material.dart';

final double kZero = 0;

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({super.key});

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn> with TickerProviderStateMixin{
  //Text('data', style: context.textTheme().titleMedium,),
  bool _isVisible = false;
  bool _isOpacity = false;
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }
  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderWidget(),
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              duration: _DurationItems.durationLow,
              opacity: _isOpacity ? 1 : 0,
              child: Text('Data')
              ),
            trailing: IconButton(onPressed: (){
              _changeOpacity();
            }, icon: Icon(Icons.precision_manufacturing_rounded)),
          ),
          AnimatedDefaultTextStyle(
            child: Text('data'), 
            style: (_isVisible ? context.textTheme().headlineSmall : context.textTheme().headlineLarge) ?? TextStyle(), 
            duration: _DurationItems.durationLow
          ),

          AnimatedIcon(
            icon: AnimatedIcons.arrow_menu, 
            progress: controller,
          ),
          AnimatedContainer(
            height: _isVisible ? kZero : MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.height * 0.2,
            duration: _DurationItems.durationLow,
            color: Colors.blue,
            margin: EdgeInsets.all(5),
          ),
          Expanded(child: Stack(
            children: [
              AnimatedPositioned(top: 10,child: Text('data'), duration: _DurationItems.durationLow)
            ],
          )),
          Expanded(
            child: AnimatedList(
              itemBuilder: (context, index, animation) {
                return Text('data');
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _changeVisible();
        controller.animateTo(_isVisible ? 1 : 0);
      }),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
      firstChild: Placeholder(), 
      secondChild: SizedBox.shrink(), 
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _DurationItems.durationLow
      );
  }
}


extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}


class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}