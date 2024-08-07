import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/user_cache/user_cache_manager.dart';
import 'package:flutter_full_learn/202/cache/user_model.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStatefull<SharedListCache> {
  late final UserCacheManager userCacheManager;
  List<UserCache> _users = UserItems().users;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userCacheManager = UserCacheManager(SharedManager());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? CircularProgressIndicator(color: Colors.black,) : null,
        actions: [
          IconButton(onPressed: () async {
            changeLoading();
            await userCacheManager.saveItems(_users);
            changeLoading();
          }, icon: Icon(Icons.save_alt)),
          IconButton(onPressed: (){}, icon: Icon(Icons.remove_outlined)),
        ],
      ),
      body: _UserListView(users: _users,),

    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView({
    super.key, required this.users,
  });

  final List<UserCache> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].description),
            trailing: Text(users[index].url, style: Theme.of(context).textTheme.titleSmall?.copyWith(
              decoration: TextDecoration.underline
            ),),
          ),
        );
      },
      );
  }
}