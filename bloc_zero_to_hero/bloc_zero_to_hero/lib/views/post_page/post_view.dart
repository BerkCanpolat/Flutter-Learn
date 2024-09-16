import 'package:bloc_zero_to_hero/bloc/post_bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(FetchDataEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post View Bloc'),),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch(state.postEnum) {
            case PostEnum.loading:
              return const Center(child: CircularProgressIndicator(),);
            case PostEnum.fail:
              return const Center(child: Text('DATA FAİL'),);
            case PostEnum.success:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                      onChanged: (value) {
                        context.read<PostBloc>().add(SearchEvent(value));
                      },
                    ),
                    Expanded(
                      child: state.searchMessage.isNotEmpty ? Center(child: Text(state.searchMessage.toString())) : ListView.builder(
                        itemCount: state.tempPostList.isEmpty ? state.postList.length : state.tempPostList.length,
                        itemBuilder: (context, index) {
                          final item = state.postList[index];
                          if(state.tempPostList.isNotEmpty) {
                            return Card(
                            child: ListTile(
                              title: Text(state.tempPostList[index].name ?? ''),
                              subtitle: Text(state.tempPostList[index].body ?? '', style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                              leading: Text(state.tempPostList[index].email ?? ''),
                            ),
                          );
                          } else {
                            return Card(
                            child: ListTile(
                              title: Text(item.name ?? ''),
                              subtitle: Text(item.body ?? '', style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                              leading: Text(item.email ?? ''),
                            ),
                          );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}