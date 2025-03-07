import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ComingSoonMovieWidget extends StatelessWidget {
  final String imageUrl;
  final String overview;
  final String logoUrl;
  final String month;
  final String day;
  const ComingSoonMovieWidget({super.key, required this.imageUrl, required this.overview, required this.logoUrl, required this.month, required this.day});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(height: 10,),
              Text(month, style: const TextStyle(fontWeight: FontWeight.bold),),
              Text(day, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40, letterSpacing: 5),),
            ],
          ),
           const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(imageUrl: imageUrl),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width:  size.width * 0.3, height: size.height * 0.2,
                      child: CachedNetworkImage(imageUrl: imageUrl, alignment: Alignment.centerLeft,),
                    ),
                    Spacer(),
                    const SizedBox(width: 10,),
                    const Column(
                      children: [
                        Icon(Icons.notifications_none_outlined, size: 25, color: Colors.white,),
                        Text('Remind me', style: TextStyle(fontSize: 10),)
                      ],
                    ),
                    const SizedBox(width: 10,),
                    const Column(
                      children: [
                        Icon(Icons.info_outline_rounded, size: 25, color: Colors.white,),
                        Text('Info', style: TextStyle(fontSize: 10),)
                      ],
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Coming on $month $day"),
                    SizedBox(height: 10,),
                    Text(overview),
                  ],
                ),
                SizedBox(height: 20,)
              ],
            ),
            
          )
        ],
      ),
    );
  }
}