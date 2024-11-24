import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/common/utils.dart';
import 'package:flutter_netflix_clone/models/upcoming_model.dart';
import 'package:flutter_netflix_clone/screens/movie_detailed_screen.dart';

class MovieCardWidget extends StatelessWidget {
  final Future<UpComingMovieModel> future;
  final String headLineText;
  const MovieCardWidget({super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future, 
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
            Text(headLineText, style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  var movie = data[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailedScreen(movieID: movie.id,)));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.network("${imageUrl}${movie.posterPath}"),
                    ),
                  );
                },
              ),
            )
          ],
        );
        } else {
          return Center(child: Text('GÖSTERİLECEK FİLM YOK'),);
        }
      },
    );
  }
}