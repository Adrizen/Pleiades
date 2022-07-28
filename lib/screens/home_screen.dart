import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('MoviesApp'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: (() => {}),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              MovieSlider(movies: moviesProvider.popularMovies, tag: 'Hot'),
              MovieSlider(
                  movies: moviesProvider.upcomingMovies, tag: 'Upcoming'),
            ],
          ),
        ));
  }
}
