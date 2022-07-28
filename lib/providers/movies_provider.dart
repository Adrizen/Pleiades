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

  MoviesProvider() {
    print('Movies Provider init');

    getOnDisplayMovies();
    getPopularMovies();
    getUpcomingMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    // Await the https get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    // Await the https get response, then decode the json-formatted response.
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  getUpcomingMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/upcoming', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    // Await the https get response, then decode the json-formatted response.
    final response = await http.get(url);
    print(url);
    final upcomingResponse = NowPlayingResponse.fromJson(response.body);
    upcomingMovies = upcomingResponse.results;
    notifyListeners();
  }
}
