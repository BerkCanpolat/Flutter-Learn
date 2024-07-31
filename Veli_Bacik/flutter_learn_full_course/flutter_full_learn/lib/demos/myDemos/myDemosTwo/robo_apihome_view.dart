import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboModel/robo_service_model.dart';
import 'package:flutter_full_learn/demos/myDemos/myDemosTwo/roboServiceManager/robo_service_manager.dart';

class RoboApihomeView extends StatefulWidget {
  const RoboApihomeView({super.key});

  @override
  State<RoboApihomeView> createState() => _RoboApihomeViewState();
}

class _RoboApihomeViewState extends State<RoboApihomeView> {
  List<RoboApiModel>? _items;
  late final RoboAbstractClass _roboApiService;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _roboApiService = RoboServiceManager();
    _roboFetchApiGet();
  }

  void _isLoadingChange() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }



  Future<void> _roboFetchApiGet() async{
    _isLoadingChange();
    _items = await _roboApiService.roboGetItems();
    _isLoadingChange();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading ? CircularProgressIndicator() : SizedBox.shrink()
        ],
      ),
      body: _items == null ? Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          var rob = _items?[index];
          return Card(
            color: Colors.black,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25, left: 10, right: 10),
                  child: Text(rob?.title ?? '', style: TextStyle(color: Colors.white),),
                ),
                Text(rob?.body ?? '',style: TextStyle(color: Colors.grey),)
              ],
            ),
          );
        },
      ),
    );
  }
}