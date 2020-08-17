import '../datamodel/moviemodel.dart';
import 'package:flutter/material.dart';

Map<int, String> movieGenre = {
  28: "Action",
  12: "Adventure",
  16: "Animation",
  35: "Comedy",
  80: "Crime",
  99: "Documentary",
  18: "Drama",
  10751: "Family",
  14: "Fantasy",
  36: "History",
  27: 'Horror',
  10402: "Music",
  9648: "Mystery",
  10749: "Romance",
  878: "Sci-Fi",
  10770: 'Tv-Movie',
  53: "Thriller",
  10752: "War",
  37: "Western",
};

// ignore: must_be_immutable
class CardTiles extends StatelessWidget {
  MovieModel movieData;

  CardTiles(this.movieData);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
      child: Card(
        elevation: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  movieData.poster_path == null
                      ? 'https://m.media-amazon.com/images/G/01/IMDb/BG_rectangle._CB1509060989_SY230_SX307_AL_.png'
                      : 'https://image.tmdb.org/t/p/w500/${movieData.poster_path}',
                  height: 150.0,
                  width: 100.0,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movieData.original_title,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Release Date:  ',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: movieData.release_date,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Genre:  ',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: movieData.genre_ids.isEmpty
                              ? '~'
                              : movieData.genre_ids.length == 2
                                  ? '${movieGenre[movieData.genre_ids[0]]},${movieGenre[movieData.genre_ids[1]]}'
                                  : movieGenre[movieData.genre_ids[0]],
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7.0),
                    child: Text(
                      '★ ${double.tryParse(movieData.vote_average).toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
