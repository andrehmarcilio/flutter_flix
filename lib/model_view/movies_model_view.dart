import 'dart:async';

import 'package:flutter_movie_application/model/movies_models.dart';

import '../services/movie_services.dart';

class MoviesListViewModel {
  int _paginaAtual = 1;
  final List<Movie> _movies = [];

  final _service = MovieService();
  final streamController = StreamController<List<Movie>>();

  getFilmesByGenre(int id) async {
   _movies.addAll(await _service.getMoviesListByGenre(_paginaAtual, id));
   streamController.sink.add(_movies);
   _paginaAtual++;
  }

  getFilmesByRecommendation(int id) async {
     _movies.addAll(await _service.getMoviesRecommendations(_paginaAtual, id));
   streamController.sink.add(_movies);
   _paginaAtual++;
  }

}