import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_application/model/movies_models.dart';

import '../model_view/details_view_model.dart';
import 'widgets/movies_list.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieDetails>(
        future: DetailViewModel().getDetails(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final movieDetails = snapshot.data!;
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        CachedNetworkImage(
                          imageUrl: "https://image.tmdb.org/t/p/w500/" +
                              movieDetails.imagemUrl,
                          width: double.infinity,
                          height: 290,
                          fit: BoxFit.cover,
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0.7, sigmaY: 0.7),
                          child: Container(
                            width: double.infinity,
                            height: 290,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 30.0, left: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movieDetails.titulo,
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Row(
                                children: [
                                  movieDetails.isAdult
                                      ? const Text("18+ |")
                                      : const SizedBox.shrink(),
                                  Text(
                                    movieDetails.duracao.toString() + " min",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 12,
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        itemBuilder: (context, position) =>
                                            (movieDetails.avaliacao / 2)
                                                        .round() >=
                                                    position + 1
                                                ? const Icon(
                                                    Icons.star,
                                                    size: 12,
                                                  )
                                                : const Icon(
                                                    Icons.star_border,
                                                    size: 12,
                                                  )),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    movieDetails.avaliacao.toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 27, 27, 27),
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Enredo",   style:  TextStyle(
                         fontSize: 19, fontWeight: FontWeight.w800),),
                         const SizedBox(
                            height: 15,
                          ),
                          Text(movieDetails.sobre, style: const  TextStyle(
                         fontWeight: FontWeight.w200, height: 1.5 ),),
                         const SizedBox(
                            height: 14,
                          ),
                         MoviesListWidget(id: movieDetails.id,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
