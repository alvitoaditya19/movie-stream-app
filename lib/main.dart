import 'package:flutter/material.dart';
import 'package:movie_stream_app/models/movie.dart';
import 'package:movie_stream_app/pages/detail_movie_page.dart';
import 'package:movie_stream_app/pages/home_page.dart';
import 'package:movie_stream_app/pages/main_page.dart';
import 'package:movie_stream_app/providers/movie_provider.dart';
import 'package:movie_stream_app/providers/page_provider.dart';
import 'package:movie_stream_app/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => MainPage(),
          '/detail-movie': (context) => DetailMoviePage(
                movie: ModalRoute.of(context)?.settings.arguments as MovieModel,
              ),
        },
      ),
    );
  }
}
