import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_stream_app/models/movie.dart';
import 'package:movie_stream_app/providers/movie_provider.dart';
import 'package:movie_stream_app/services/movie_services.dart';
import 'package:movie_stream_app/shared/theme.dart';
import 'package:movie_stream_app/widgets/film_card.dart';
import 'package:movie_stream_app/widgets/movie_continue_card.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<MovieProvider>(context, listen: false).getMovies();
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
    MovieProvider movieProvider = Provider.of<MovieProvider>(context);
    // print(movieProvider.getMovies());

    Widget header() {
      return Container(
        height: 200,
        margin: EdgeInsets.fromLTRB(defaultMargin, 14, defaultMargin, 0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            // height: 198,
            // margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: imgList
                      .map((item) => Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(item),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [
                                      Colors.black.withOpacity(0.1),
                                      Colors.black.withOpacity(0.5),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 12, top: 12),
                        child: Column(
                          children: [
                            Text(
                              'Trending Now',
                              style: whiteTextStyle.copyWith(
                                  color: Colors.white.withOpacity(0.7)),
                            ),
                            Text(
                              'Sing 2',
                              style: whiteTextStyle.copyWith(
                                fontSize: 32,
                              ),
                            ),
                          ],
                        )),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
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
                          margin: EdgeInsets.only(right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: map<Widget>(imgList, (index, url) {
                              return Container(
                                width: 10.0,
                                height: 10.0,
                                margin: EdgeInsets.only(right: 6),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex == index
                                      ? kWhiteColor
                                      : kGrey3Color,
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )),
      );
    }

    Widget searchDestination() {
      return GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kGreyColor,
          ),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                color: kGrey2Color,
                size: 36.0,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Find a Profesional Doctor',
                style: grey2TextStyle,
              ),
            ],
          ),
        ),
      );
    }

    Widget continueTitle() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 14, defaultMargin, 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Continue Watching',
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 22,
                height: 24,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/ic_next.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget continueFilm() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieContinueCard(),
              MovieContinueCard(),
            ],
          ),
        ),
      );
    }

    Widget filmTitle() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 14, defaultMargin, 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Best Choice For you',
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 22,
                height: 24,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/ic_next.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget contentFilm() {
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
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.movies.length,
              itemBuilder: (context, index) => FilmCard(state.movies[index]),
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
              searchDestination(),
              header(),
              continueTitle(),
              continueFilm(),
              filmTitle(),
              contentFilm(),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
