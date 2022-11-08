import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/search/search_delegate.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  leading: const IconButton(
                      onPressed: funcion, icon: Icon(Icons.menu)),
                  title: const Text('Antlia - A movie\'s cluster'),
                  floating: true,
                  snap: true,
                  centerTitle: true,
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20))),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: (() => showSearch(
                          context: context, delegate: MovieSearchDelegate())),
                    )
                  ],
                )
              ],
          body: SingleChildScrollView(
            child: Column(
              children: [
                CardSwiper(movies: moviesProvider.onDisplayMovies),
                MovieSlider(
                    movies: moviesProvider.popularMovies,
                    tag: 'Hot',
                    onNextPage: () => moviesProvider.getPopularMovies()),
                MovieSlider(
                    movies: moviesProvider.upcomingMovies,
                    tag: 'Upcoming',
                    onNextPage: () => moviesProvider.getUpcomingMovies()),
              ],
            ),
          )),
    );
  }
}

void funcion() {
  //TODO: Hacer menu opciones / settings. Por ejemplo para cambiar de theme la app.
}
