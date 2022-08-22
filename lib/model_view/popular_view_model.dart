import 'dart:async';

import 'package:flutter_movie_application/model/movies_models.dart';

import '../services/movie_services.dart';

class PopularMovieViewModel {

  final _service = MovieService();

  Future<Movie> getMovie() async {
   return await _service.getPopularMovie();
  }

}