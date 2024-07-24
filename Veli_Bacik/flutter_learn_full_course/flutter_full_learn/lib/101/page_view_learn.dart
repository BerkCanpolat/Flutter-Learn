import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7);
  int _currentPageIndex = 0;
  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(_currentPageIndex.toString()),
          ),
          Spacer(),
          FloatingActionButton(
            onPressed: (){
              _pageController.previousPage(duration: _DurationUtility._durationLow, curve: Curves.slowMiddle);
            }, 
            child: Icon(Icons.keyboard_arrow_left_outlined),
          ),
          FloatingActionButton(
            onPressed: (){
              _pageController.nextPage(duration: _DurationUtility._durationLow, curve: Curves.slowMiddle);
            }, 
            child: Icon(Icons.arrow_right_alt_rounded),
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        padEnds: false,
        controller: _pageController,
        onPageChanged: _updatePageIndex,
        children: [
          ImageLearnView(),
          IconLearnView(),
          StackLearn()
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const _durationLow = const Duration(seconds: 1);
}