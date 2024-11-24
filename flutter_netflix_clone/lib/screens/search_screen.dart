import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/common/utils.dart';
import 'package:flutter_netflix_clone/models/movie_recommendation_models.dart';
import 'package:flutter_netflix_clone/models/search_movie_model.dart';
import 'package:flutter_netflix_clone/services/api_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  ApiServices apiServices = ApiServices();

  SearchMovieModel? searchMovieModel;

  late Future<MovieRecommendationModel> popularMovies;

  void search(String query) {
    apiServices.getSearchMovies(query).then((value) {
      setState(() {
        searchMovieModel = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    popularMovies = apiServices.getPopularMovies();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CupertinoSearchTextField(
                padding: EdgeInsets.all(10),
                controller: searchController,
                prefixIcon: Icon(Icons.search, color: Colors.grey,),
                suffixIcon: Icon(Icons.cancel, color: Colors.grey,),
                style: TextStyle(
                  color: Colors.white
                ),
                backgroundColor: Colors.grey.withOpacity(0.3),
                onChanged: (value) {
                  if(value.isEmpty) {
          
                  } else {
                    search(searchController.text);
                  }
                },
              ),
              searchController.text.isEmpty ? FutureBuilder(
                    future: popularMovies, 
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: const CircularProgressIndicator());
                      } else if(snapshot.hasError) {
                        return Center(child: Text('Bir hata oluştu: ${snapshot.error}'),);
                      } else if(snapshot.hasData && snapshot.data != null) {
                      var data = snapshot.data?.results;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
              Text("Top Searches", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  var movie = data[index];
                  return Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Image.network("${imageUrl}${movie.posterPath}"),
                        SizedBox(width: 20,),
                        SizedBox(
                          width: 260,
                          child: Text(data[index].title ?? "", maxLines: 2, overflow: TextOverflow.ellipsis,))
                      ],
                    ),
                  );
                },
              )
                        ],
                      );
                      } else {
                        return Center(child: Text('GÖSTERİLECEK FİLM YOK'),);
                      }
                    },
                  ) :
              searchMovieModel == null ? Center(child: SizedBox.shrink(),) : GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: searchMovieModel?.results!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1.2 / 2 
                 ), 
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      searchMovieModel!.results![index].backdropPath == null ? Image.asset('assets/netflix.png', height: 170,) : CachedNetworkImage(
                        imageUrl: "${imageUrl}${searchMovieModel!.results?[index].backdropPath}",
                         height: 170,
                        ),
                      // CachedNetworkImage(
                      //   imageUrl: getImageUrl(searchMovieModel?.results?[index].backdropPath,),
                      //   placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                      //   errorWidget: (context, url, error) => Icon(Icons.error),
                      // ),
                      Text(searchMovieModel?.results?[index].originalTitle ?? "", style: TextStyle(
                        fontSize: 14
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}