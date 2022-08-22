import 'dart:convert';

import 'package:flutter_movie_application/model/movies_models.dart';
import 'package:http/http.dart' as http;

const key = "your_moviedb_api_key_version_3";

class MovieService {

  Future<Movie> getPopularMovie() async {
    try {
    final url = Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=$key&language=pt-BR&page=1");
    final request = await http.get(url);
    final data = request.body;
    return MoviesList.fromJson(jsonDecode(data)).movies[1];
    } catch (e) {
      throw Error();
    }
  }

  Future<Map> getMovieDetails(int id) async {
    try {
     final url = Uri.parse("https://api.themoviedb.org/3/movie/$id?api_key=$key&language=pt-BR");
    final request = await http.get(url);
    final data = request.body;
  
    return jsonDecode(data);
    } catch (err) {
           return {};
    }
  }


  Future<List<Genero>> getGenreList() async {
    try {
    final url = Uri.parse("https://api.themoviedb.org/3/genre/movie/list?api_key=$key&language=pt-BR");
    final request = await http.get(url);
    final data = request.body;
    return GenerosList.fromJson(jsonDecode(data)).generos;
    } catch (e) {
      return [];
    }
  }


  Future<List<Movie>> getMoviesListByGenre(int page, int genreId) async {
    try {
    final url = Uri.parse("https://api.themoviedb.org/3/discover/movie?api_key=$key&language=pt-BR&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page&with_genres=$genreId&with_watch_monetization_types=flatrate");
    final request = await http.get(url);
    final data = request.body;
    return MoviesList.fromJson(jsonDecode(data)).movies;
    } catch (e) {
      return [];
    }
  }

  Future<List<Movie>> getMoviesRecommendations(int page, int id) async {
    try {
    final url = Uri.parse("https://api.themoviedb.org/3/movie/$id/recommendations?api_key=$key&language=pt-BR&page=$page");
    final request = await http.get(url);
    final data = request.body;
    return MoviesList.fromJson(jsonDecode(data)).movies;
    } catch (e) {
      return [];
    }
  }
}