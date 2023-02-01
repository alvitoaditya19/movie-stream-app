import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream_app/models/movie.dart';
import 'package:movie_stream_app/providers/movie_provider.dart';
import 'package:movie_stream_app/providers/wishlist_provider.dart';
import 'package:movie_stream_app/shared/shared_value.dart';
import 'package:movie_stream_app/shared/theme.dart';
import 'package:movie_stream_app/widgets/cast_card.dart';
import 'package:movie_stream_app/widgets/similar_film.dart';
import 'package:provider/provider.dart';

class DetailMoviePage extends StatefulWidget {
  final MovieModel? movie;
  const DetailMoviePage({
    Key? key,
    required this.movie,
  }) : super(key: key);
  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  @override
  initState() {
    super.initState();
  }

  final List<String> imgList = [
    'assets/img_sing2.png',
    'assets/img_continue1.png',
    'assets/img_sing2.png',
    'assets/img_continue1.png',
    'assets/img_sing2.png',
    'assets/img_continue1.png',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            bottom: 20, right: defaultMargin, left: defaultMargin, top: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 38,
                width: 38,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: kGreyColor),
                child: Image.asset(
                  'assets/ic_back_inact.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            Spacer(),
            Text(
              'Detail Movie',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: medium),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                wishlistProvider.setMovie(widget.movie!);

                if (wishlistProvider.isWishlist(widget.movie!)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kGreenColor,
                      content: Text(
                        'Has been added to the Wishlist',
                        textAlign: TextAlign.center,
                        style: whiteTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kRedColor,
                      content: Text(
                        'Has been removed from the Wishlist',
                        textAlign: TextAlign.center,
                        style: whiteTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                  );
                }
              },
              child: Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: kGreyColor),
                child: Image.asset(
                  wishlistProvider.isWishlist(widget.movie!)
                      ? 'assets/ic_like_act.png'
                      : 'assets/ic_like_inact.png',
                ),
              ),
            ),
            // Container(
            //   height: 38,
            //   width: 38,
            //   padding: EdgeInsets.all(3),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(4), color: kGreyColor),
            //   child: Image.asset(
            //     'assets/ic_like_inact.png',
            //     width: 20,
            //     height: 20,
            //   ),
            // )
          ],
        ),
      );
    }

    Widget posterFilm() {
      return Container(
        height: 198,
        margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageBaseURL +
                    "w500" +
                    (widget.movie!.backdropPath! ?? widget.movie!.posterPath!)),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 130,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      margin: EdgeInsets.only(bottom: 14, left: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: kRedColor,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/ic_poly.png'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Let’s Watch',
                            style: whiteTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: EdgeInsets.only(bottom: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: kGreyColor,
                    ),
                    child: Text(
                      '1h 50m',
                      style: whiteTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 14, defaultMargin, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.movie!.title!,
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: kGrey2Color,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Family Film',
                  style: grey2TextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: kGrey2Color,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Schi-Fi',
                  style: grey2TextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: kGrey2Color,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '7 Januari 2022',
                  style: grey2TextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.movie!.overview!,
              maxLines: 5,
              style: grey2TextStyle.copyWith(
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }

    Widget cast() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cast',
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CastCard(),
                  CastCard(),
                  CastCard(),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget similarFilm() {
      return Container(
        margin:
            EdgeInsets.only(top: 20, left: defaultMargin, right: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Similar Movie',
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    }

    Widget contentSimilarFilm() {
      return Consumer<MovieProvider>(builder: (context, state, _) {
        if (state.state == MovieState.Loading) {
          return Container(
            height: 120,
            child: Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(kRedColor),
              ),
            ),
          );
        } else if (state.state == MovieState.HasData) {
          return Container(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              shrinkWrap: true,
              itemCount: state.movies.length,
              itemBuilder: (context, index) => SimilarFilm(state.movies[index]),
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                "Data tidak di temukan",
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
          );
        }
      });
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              posterFilm(),
              description(),
              cast(),
              similarFilm(),
              contentSimilarFilm()
            ],
          ),
        ),
      ),
    );
  }
}
