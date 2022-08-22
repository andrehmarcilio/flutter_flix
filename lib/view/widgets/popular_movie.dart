import 'package:flutter/material.dart';
import 'package:flutter_movie_application/model/movies_models.dart';
import 'package:flutter_movie_application/model_view/popular_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class PopularMovie extends StatelessWidget {
  PopularMovie({Key? key}) : super(key: key);

  final popularViewModel = PopularMovieViewModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
        future: popularViewModel.getMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final popularMovie = snapshot.data!;
            return SizedBox(
              height: 570,
              width: 300,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CachedNetworkImage(
                    cacheManager: CacheManager(Config(
                      "flutterpopmovie",
                      stalePeriod: const Duration(days: 3),
                    )),
                    imageUrl: "https://image.tmdb.org/t/p/w500/" +
                        popularMovie.imagemUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                      height: 255 * 2,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 255,
                        itemBuilder: (context, position) => Container(
                            height: 2,
                            color: Color.fromARGB(position, 0, 0, 0)),
                      )),
                  SizedBox(
                      height: 255 * 2,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 255,
                        itemBuilder: (context, position) => Container(
                            height: 2,
                            color: Color.fromARGB(position, 0, 0, 0)),
                      ))
                ],
              ),
            );
          } else {
            return const SizedBox(
              height: 570,
              child:  Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
