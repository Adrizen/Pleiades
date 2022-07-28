import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '164a8d223dc5be626dac8db357a43ba4';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'en-EN';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> upcomingMovies = [];
  int _popularPage = 0;
  int _upcomingPage = 0;

  MoviesProvider() {
    print('Movies Provider init');

    getOnDisplayMovies();
    getPopularMovies();
    getUpcomingMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });
    // Await the https get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  getUpcomingMovies() async {
    _upcomingPage++;
    final jsonData = await _getJsonData('3/movie/upcoming', _upcomingPage);
    final upcomingResponse = NowPlayingResponse.fromJson(jsonData);
    upcomingMovies = upcomingResponse.results;
    notifyListeners();
  }
}
