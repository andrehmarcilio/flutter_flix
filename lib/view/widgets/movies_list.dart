import 'package:flutter/material.dart';
import 'package:flutter_movie_application/view/widgets/movie.dart';

import '../../model/movies_models.dart';
import '../../model_view/movies_model_view.dart';

class MoviesListWidget extends StatefulWidget {
  const MoviesListWidget(
      {Key? key, this.genero = "Filmes Semelhantes", required this.id})
      : super(key: key);
  final String genero;
  final int id;

  @override
  State<MoviesListWidget> createState() => _MoviesListWidgetState();
}

class _MoviesListWidgetState extends State<MoviesListWidget> {
  final viewModel = MoviesListViewModel();

  @override
  void initState() {
    super.initState();
    if (widget.genero == "Filmes Semelhantes") {
      viewModel.getFilmesByRecommendation(widget.id);
    } else {
      viewModel.getFilmesByGenre(widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            widget.genero,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 21.0, fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(
          height: 214,
          child: StreamBuilder<List<Movie>>(
            stream: viewModel.streamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length + 1,
                  itemBuilder: (context, position) {
                    if (position < snapshot.data!.length) {
                      final movie = snapshot.data![position];
                      return MovieWidget(
                        imageUrl: movie.imagemUrl,
                        id: movie.id,
                      );
                    } else {
                      if (widget.genero == "Filmes Semelhantes") {
                        viewModel.getFilmesByRecommendation(widget.id);
                      } else {
                        viewModel.getFilmesByGenre(widget.id);
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
