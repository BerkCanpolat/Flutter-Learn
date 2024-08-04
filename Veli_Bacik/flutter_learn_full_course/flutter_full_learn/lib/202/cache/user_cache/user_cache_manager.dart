import 'dart:convert';

import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(List<UserCache> items) async {
    final _items = items.map((e) => jsonEncode(e)).toList();
   await  sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<UserCache>? getItems() {
    final itemString = sharedManager.getStringItems(SharedKeys.users);
    if (itemString?.isNotEmpty ?? false) {
      return itemString!.map((e) {
        final jsonObject = jsonDecode(e);
        return UserCache('name', 'description', 'url');
      }).toList();
    }
    return null;
    
  }
}