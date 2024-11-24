import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/common/utils.dart';
import 'package:flutter_netflix_clone/models/tv_series_model.dart';
import 'package:flutter_netflix_clone/models/upcoming_model.dart';
import 'package:flutter_netflix_clone/services/api_services.dart';
import 'package:flutter_netflix_clone/widgets/custom_carousel.dart';
import 'package:flutter_netflix_clone/widgets/movie_card_widget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<UpComingMovieModel> upcomingFuture;
  late Future<UpComingMovieModel> nowPlayingFuture;
  late Future<TvSeriesModel> topRatedFuture;

  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upcomingFuture = apiServices.getUpcomingMovies();
    nowPlayingFuture = apiServices.getNowPlayingMovies();
    topRatedFuture = apiServices.getTvopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          title: Image.asset(
            'assets/logo.png',
            height: 50,
            width: 120,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 27,
                width: 27,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: topRatedFuture, 
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(),);
                  } else if(snapshot.hasError) {
                    return Center(child: Text('Bir Hata Oluştu: ${snapshot.error}'),);
                  } else if(snapshot.hasData && snapshot.data != null) {
                  return CustomCarouselSlider(data: snapshot.data!); 

                  } else {
                    return const Center(child: Text('VERİLER GELMEDİ'),);
                  }
                },
               ),
              SizedBox(
                height: 220,
                child: MovieCardWidget(
                    future: upcomingFuture, headLineText: "Upcoming Movies"),
              ),
              SizedBox(
                height: 220,
                child: MovieCardWidget(
                    future: nowPlayingFuture, headLineText: "Now Playing Movies"),
              ),
            ],
          ),
        ));
  }
}
