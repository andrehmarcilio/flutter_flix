class Movie {
  int id;
  String titulo;
  String sobre;
  String imagemUrl;

  Movie.fromJson(Map json)
      : id = json["id"] as int,
        titulo = json["title"],
        sobre = json["overview"],
        imagemUrl = json["poster_path"];


  @override
  String toString() {
    return "id: $id, titulo: $titulo, sobre: $sobre, imagem: $imagemUrl";
  }
}



class MoviesList {
  int page;
  List<Movie> movies;

  factory MoviesList.fromJson(Map json) {
    final page = json["page"] as int;
    final results = json["results"] as List<dynamic>;

    final movies = results.map((e) => Movie.fromJson(e)).toList();


   return MoviesList(page, movies);
  }

  MoviesList(this.page, this.movies);

   @override
  String toString() {
    return "page: $page, movies: $movies";
  }

}



class MovieDetails {
  int id;
  String titulo;
  String sobre;
  String imagemUrl;
  bool isAdult;
  double popularity;
  String status;
  int duracao;
  double avaliacao;

  MovieDetails.fromJson(Map json)
      : id = json["id"] as int,
        titulo = json["title"],
        sobre = json["overview"],
        imagemUrl = json["backdrop_path"],
        isAdult = json["adult"] as bool,
        popularity = json["popularity"] as double,
        status = json["status"],
        duracao= json["runtime"] as int,
        avaliacao = json["vote_average"] as double;


  @override
  String toString() {
    return "id: $id, titulo: $titulo, sobre: $sobre, imagem: $imagemUrl";
  }
}



class Genero {
  int id;
  String nome;
  

  Genero.fromJson(Map json)
      : id = json["id"] as int,
        nome = json["name"];


  @override
  String toString() {
    return "id: $id, nome: $nome";
  }
}


class GenerosList {

  List<Genero> generos;

  factory GenerosList.fromJson(Map json) {
    final results = json["genres"] as List<dynamic>;
    final movies = results.map((e) => Genero.fromJson(e)).toList();
   return GenerosList(movies);
  }

  GenerosList(this.generos);

   @override
  String toString() {
    return "generos: $generos";
  }

}
