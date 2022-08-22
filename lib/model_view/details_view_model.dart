import 'dart:async';

import 'package:flutter_movie_application/model/movies_models.dart';

import '../services/movie_services.dart';

class DetailViewModel {

  final _service = MovieService();

  Future<MovieDetails> getDetails(int id) async {
   return MovieDetails.fromJson(await _service.getMovieDetails(id));
  }

}