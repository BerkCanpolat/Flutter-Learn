
import 'package:flutter_netflix_clone/common/utils.dart';
import 'package:flutter_netflix_clone/models/movie_recommendation_models.dart';
import 'package:flutter_netflix_clone/models/search_movie_model.dart';
import 'package:flutter_netflix_clone/models/tv_series_model.dart';
import 'package:flutter_netflix_clone/models/upcoming_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apiKey";
late String endPoint;


class ApiServices {
  Future<UpComingMovieModel> getUpcomingMovies() async {
    endPoint="movie/upcoming";
    final url="$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      //log("Success Response: ${response.body}");

      return UpComingMovieModel.fromJson(response.body);
    }
    throw Exception("Failed to load upcoming movies");
  }

  Future<UpComingMovieModel> getNowPlayingMovies() async {
    endPoint="movie/now_playing";
    final url="$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      //log("Success Response: ${response.body}");

      return UpComingMovieModel.fromJson(response.body);
    }
    throw Exception("Failed to load now playing movies");
  }


  Future<TvSeriesModel> getTvopRatedMovies() async {
    endPoint="tv/top_rated";
    final url="$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      //log("Success Response: ${response.body}");

      return TvSeriesModel.fromJson(response.body);
    }
    throw Exception("Failed to load Top Rated movies");
  }


  Future<SearchMovieModel> getSearchMovies(String searchText) async {
    endPoint="search/movie?query=$searchText";
    final url="$baseUrl$endPoint";

    print("Search url is $url");

    final response = await http.get(Uri.parse(url), headers: {"Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDU5MDA2NmE0MzRkODZjNjYxYjRlYTA3ZmE2MThlOCIsIm5iZiI6MTczMjQ0NjI5MS4zOTM4MDMxLCJzdWIiOiI2NzQzMDM0YzgzMTU4YjBiMjY0N2JiYjQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.LKYwzDJP9d5Ox-G5dPdTMVhRsTejaUjIYri0s4hGP7A"});

    if(response.statusCode == 200) {
      //log("Success Response: ${response.body}");

      return SearchMovieModel.fromJson(response.body);
    }
    throw Exception("Failed to load Search movies");
  }


  Future<MovieRecommendationModel> getPopularMovies() async {
    endPoint="movie/popular";
    final url="$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      //log("Success Response: ${response.body}");

      return MovieRecommendationModel.fromJson(response.body);
    }
    throw Exception("Failed to load Popular movies");
  }
}