import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      margin: const EdgeInsets.only(top: 20),
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        axisDirection: AxisDirection.right,
        itemWidth: size.width * 0.7,
        itemHeight: size.height * 0.9,
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterPath),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}