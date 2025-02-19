import 'package:flutter/material.dart';
import 'package:silcemknk/api_service.dart';
import 'package:silcemknk/model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  late Future<List<Model?>>? userModel;
  ApiService apiService = ApiService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = apiService.apiServiceGet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: userModel, 
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          } else if(snapshot.hasError) {
            return Center(child: Text("hata ${snapshot.error}"),);
          } else if(snapshot.hasData) {
            final List<Model?>? den = snapshot.data;

            return ListView.builder(
              itemCount: den?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(den?[index]?.title ?? ""),
                    subtitle: Text(den?[index]?.body ?? ""),
                  ),
                );  
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}