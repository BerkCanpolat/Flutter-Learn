import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/common/utils.dart';
import 'package:flutter_netflix_clone/models/movie_recommendation_models.dart';
import 'package:flutter_netflix_clone/models/search_movie_model.dart';
import 'package:flutter_netflix_clone/screens/movie_detailed_screen.dart';
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
    super.initState();
    popularMovies = apiServices.getPopularMovies();
  }


  @override
  void dispose() {
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
                padding: const EdgeInsets.all(10),
                controller: searchController,
                prefixIcon: const Icon(Icons.search, color: Colors.grey,),
                suffixIcon: const Icon(Icons.cancel, color: Colors.grey,),
                style: const TextStyle(
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
                        return const Center(child: CircularProgressIndicator());
                      } else if(snapshot.hasError) {
                        return Center(child: Text('Bir hata oluştu: ${snapshot.error}'),);
                      } else if(snapshot.hasData && snapshot.data != null) {
                      var data = snapshot.data?.results;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
              const Text("Top Searches", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 20,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  var movie = data[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailedScreen(movieID: data[index].id ?? 0,)));
                    },
                    child: Container(
                      height: 150,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Image.network("${imageUrl}${movie.posterPath}"),
                          const SizedBox(width: 20,),
                          SizedBox(
                            width: 260,
                            child: Text(data[index].title ?? "", maxLines: 2, overflow: TextOverflow.ellipsis,))
                        ],
                      ),
                    ),
                  );
                },
              )
                        ],
                      );
                      } else {
                        return const Center(child: Text('GÖSTERİLECEK FİLM YOK'),);
                      }
                    },
                  ) :
              searchMovieModel == null ? const Center(child: SizedBox.shrink(),) : GridView.builder(
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                itemCount: searchMovieModel?.results!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1.2 / 2 
                 ), 
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailedScreen(movieID: searchMovieModel!.results![index].id ?? 0)));
                    },
                    child: Column(
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
                        Text(searchMovieModel?.results?[index].originalTitle ?? "", style: const TextStyle(
                          fontSize: 14
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
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