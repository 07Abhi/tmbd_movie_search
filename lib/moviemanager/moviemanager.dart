import 'package:flutter/cupertino.dart';
import '../datamodel/moviemodel.dart';

Map <int, String> movieGenre = {
  28:"Action",
  12:"Adventure",
  16:"Animation",
  35:"Comedy",
  80:"Crime",
  99:"Documentary",
  18:"Drama",
  10751:"Family",
  14:"Fantasy",
  36:"History",
  10402:"Horror",
  9648:"Music",
  10749:"Mystery",
  878:"Romance",
  10770:"Sci-Fi",
  53:"Tv-Movie",
  10752:"War",
  37:"Western",
};
class MovieManager extends ChangeNotifier {
  List<MovieModel> _movieslist = [];
  List<String> _genreList = [];

  List<MovieModel> get list => [..._movieslist];
  List<String> get genrelist =>[..._genreList];

  void addListData(List<MovieModel> searchResult) {
    _movieslist = searchResult;
    notifyListeners();
  }
  void clearDataList(){
    _movieslist.clear();
    notifyListeners();
  }
}
