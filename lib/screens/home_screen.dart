import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: [CardSwiper()],
        ));
  }
}
