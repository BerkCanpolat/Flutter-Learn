import 'package:bloc_api/bloc_user_api_project/repository/repository_user.dart';
import 'package:bloc_api/bloc_user_api_project/user_bloc/user_bloc.dart';
import 'package:bloc_api/bloc_user_api_project/user_bloc/user_event.dart';
import 'package:bloc_api/bloc_user_api_project/user_bloc/user_state.dart';
import 'package:bloc_api/bloc_user_api_project/user_model/user_model.dart';
import 'package:bloc_api/bloc_user_api_project/user_page/user_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(RepositoryProvider.of<UserRepository>(context))..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Home'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if(state is UserLoadingState) {
              return const Center(child: CircularProgressIndicator(),
            );
           }
           if(state is UserLoadedState) {
            List<UserModel> userList = state.user;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailPage(user: userList[index])));
                  },
                  child: Card(
                    color: Colors.blue,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(userList[index].first_name, style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white
                      ),),
                      subtitle: Text(userList[index].last_name, style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white
                      ),),
                      trailing: CircleAvatar(
                        backgroundImage: NetworkImage(userList[index].avatar),
                      ),
                    ),
                  ),
                );
              },
            );
           }
           return Container();
          },
        ),
      ),
    );
  }
}