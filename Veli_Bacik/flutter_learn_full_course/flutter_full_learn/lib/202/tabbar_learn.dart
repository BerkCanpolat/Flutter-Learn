import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/101/stack_learn.dart';
import 'package:flutter_full_learn/101/text_learn_view.dart';

class TabbarLearn extends StatefulWidget {
  const TabbarLearn({super.key});

  @override
  State<TabbarLearn> createState() => _TabbarLearnState();
}

class _TabbarLearnState extends State<TabbarLearn> with TickerProviderStateMixin{
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length, 
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(onPressed: (){
          _tabController.animateTo(_MyTabViews.home.index);
        }),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          child: _myTabView(),
        ),
/*         appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: [
            Tab(text: 'Sayfa1',),
            Tab(text: 'Sayfa2',),
          ]),
        ), */
        body: _tabbarView(),
      )
    );
  }

  TabBar _myTabView() {
    return TabBar(
          //isScrollable: true,
          controller: _tabController,
          padding: EdgeInsets.zero,
          tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList());
  }

  TabBarView _tabbarView() {
    return TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
        ImageLearnView(),
        IconLearnView(),
        StackLearn(),
        TextLearnView()
      ]);
  }
}

enum _MyTabViews {
  home,
  settings,
  profile,
  favorite
}

extension _MyTabViewExtension on _MyTabViews {
}