import 'package:flutter_netflix_clone/common/utils.dart';
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
}