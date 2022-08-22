import 'dart:async';

import 'package:flutter_movie_application/model/movies_models.dart';

import '../services/movie_services.dart';

class HomeListViewModel {
  final List<Genero> _generos = [];

  final _service = MovieService();
  final generosStreamController = StreamController<List<Genero>>();

  getGeneros() async {
   _generos.addAll(await _service.getGenreList());
   generosStreamController.sink.add(_generos);
  }
  
}