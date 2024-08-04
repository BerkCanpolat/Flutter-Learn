import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearnCache extends StatefulWidget {
  const SharedLearnCache({super.key});

  @override
  State<SharedLearnCache> createState() => _SharedLearnCacheState();
}

class _SharedLearnCacheState extends LoadingStatefull<SharedLearnCache> {
  int _currentValue = 0;
  late final SharedManager _manager;
  late final List<UserCache> userItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _manager = SharedManager();
    _manager.init();
    userItems = UserItems().users;
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
/*     final prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt('counter'); */
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if(_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [
          _loading()
        ],
        ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
       ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton()
        ],
      ),
    );
  }

  SingleChildRenderObjectWidget _loading() {
    return isLoading ? Center(child: CircularProgressIndicator(color: Colors.red,),) : 
        SizedBox.shrink();
  }


  //SAVE BUTTON
  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      onPressed: () async{
        changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      }, 
      child: Icon(Icons.data_object_outlined)
    );
  }


  //REMOVE BUTTON
  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: () async{
        changeLoading();
        _manager.removItem(SharedKeys.counter);
        changeLoading();
      }, 
      child: Icon(Icons.remove_done_sharp)
    );
  }
}


//USER LİST VİEW BUİLDER


//Generic => T
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
    bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}

class UserItems {
  late final List<UserCache> users;
  UserItems() {
    users = [
      UserCache('Berk', '101', 'berkC.dev'),
      UserCache('Berk2', '102', 'berkC.dev'),
      UserCache('Berk3', '103', 'berkC.dev'),
    ];
  }
}