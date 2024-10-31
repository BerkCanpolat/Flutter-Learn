import 'package:bloc_api/bloc_user_api_project/repository/repository_user.dart';
import 'package:bloc_api/bloc_user_api_project/user_bloc/user_bloc.dart';
import 'package:bloc_api/bloc_user_api_project/user_bloc/user_event.dart';
import 'package:bloc_api/bloc_user_api_project/user_bloc/user_state.dart';
import 'package:bloc_api/bloc_user_api_project/user_page/user_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  late UserBloc userBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userBloc = UserBloc(UserRepository())..add(LoadUserEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userBloc,
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
            final userList = state.user;
            final u = userList.data;
            return ListView.builder(
              itemCount: u.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailPage(user: u[index])));
                  },
                  child: Card(
                    color: Colors.blue,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(u[index].first_name, style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white
                      ),),
                      subtitle: Text(u[index].last_name, style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white
                      ),),
                      trailing: CircleAvatar(
                        backgroundImage: NetworkImage(u[index].avatar),
                      ),
                    ),
                  ),
                );
              },
            );
           }
           if(state is UserErrorState) {
            return const Center(child: Text('ERROR'),);
           }
           return Container();
          },
        ),
      ),
    );
  }
}