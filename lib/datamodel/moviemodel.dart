class MovieModel {
  final String poster_path;
  final String original_title;
  final String vote_average;
  final String release_date;
  final List<dynamic> genre_ids;

  MovieModel({
    this.poster_path,
    this.original_title,
    this.vote_average,
    this.release_date,
    this.genre_ids,
  });

  factory MovieModel.getData(data) {
    return MovieModel(
      poster_path: data['poster_path'],
      original_title: data['original_title'],
      vote_average: data['vote_average'].toString(),
      release_date: data['release_date'],
      genre_ids: data['genre_ids'],
    );
  }
}
