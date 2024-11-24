import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/common/utils.dart';
import 'package:flutter_netflix_clone/models/movie_detailed_models.dart';
import 'package:flutter_netflix_clone/models/movie_recommendation_models.dart';
import 'package:flutter_netflix_clone/services/api_services.dart';

class MovieDetailedScreen extends StatefulWidget {
  final int movieID;
  const MovieDetailedScreen({super.key, required this.movieID});

  @override
  State<MovieDetailedScreen> createState() => _MovieDetailedScreenState();
}

class _MovieDetailedScreenState extends State<MovieDetailedScreen> {
  ApiServices apiServices = ApiServices();
  late Future<MovieDetailModels> movieDetail;
  late Future<MovieRecommendationModel> movieRecom;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchInitialData();
  }

  fetchInitialData() {
    setState(() {
      movieDetail = apiServices.getMovieDetail(widget.movieID);
      movieRecom = apiServices.getRecommendationMovies(widget.movieID);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("FİLMİN DETAYINA GİTTİĞİM ID: ${widget.movieID}");
    return Scaffold(
      body: FutureBuilder(
        future: movieDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final movie = snapshot.data;
            String genreText = movie!.genres!.map((e) => e.name).join(', ');
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "${imageUrl}${movie.posterPath}"),
                            ),
                          ),
                          child: SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title ?? "",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            movie.releaseDate!.year.toString(),
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            genreText,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        movie.overview ?? "",
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Builder(builder: (context) {
                    return FutureBuilder(
                      future: movieRecom,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final rec = snapshot.data;
                          return rec!.results!.isEmpty
                              ? SizedBox()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("More Like This"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    GridView.builder(
                                      itemCount: rec.results!.length,
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              mainAxisSpacing: 15,
                                              crossAxisSpacing: 5,
                                              childAspectRatio: 1.2 / 2),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailedScreen(movieID: rec.results![index].id ?? 0,)));
                    },
                                          child: CachedNetworkImage(
                                              imageUrl:
                                                  "${imageUrl}${rec.results![index].posterPath}"),
                                        );
                                      },
                                    ),
                                  ],
                                );
                        } else {
                          return const Center(
                            child: Text('Film detayı hata'),
                          );
                        }
                      },
                    );
                  }),
                ],
              ),
            );
          } else {
            return const Center(
              child: SizedBox(),
            );
          }
        },
      ),
    );
  }
}
