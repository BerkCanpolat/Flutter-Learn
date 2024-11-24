import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/widgets/coming_soon_movie_widget.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('New & Hot', style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.black,
            actions: [
              const Icon(Icons.cast, color: Colors.white,),
              const SizedBox(width: 20,),
              ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 27,
                width: 27,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 20,),
            ],
            bottom: TabBar(
              dividerColor: Colors.black,
              isScrollable: false,
              unselectedLabelColor: Colors.white,
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14
              ),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
              ),
              tabs: [
              Tab(text: "  🍿 Coming Soon   ",),
              Tab(text: "  🔥 Everyone's Wathing   ",),
            ]
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    ComingSoonMovieWidget(
                      imageUrl: 'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                      overview:  'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                      logoUrl: "https://s3.amazonaws.com/www-inside-design/uploads/2017/10/strangerthings_feature-983x740.jpg",
                      month: "Jun", 
                      day: "19"
                    ),
                    SizedBox(height: 20,),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://www.pinkvilla.com/images/2022-09/rrr-review.jpg',
                      overview:  'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
                      logoUrl: "https://www.careerguide.com/career/wp-content/uploads/2023/10/RRR_full_form-1024x576.jpg",
                      month: "Mar", 
                      day: "07"
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: ComingSoonMovieWidget(
                        imageUrl: 'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                        overview:  'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                        logoUrl: "https://s3.amazonaws.com/www-inside-design/uploads/2017/10/strangerthings_feature-983x740.jpg",
                        month: "Jun", 
                        day: "19"
                      ),
              ),
            ],
          ),
        ),
      )
    );
  }
}