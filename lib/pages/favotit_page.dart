import 'package:flutter/material.dart';
import 'package:movie_stream_app/models/movie.dart';
import 'package:movie_stream_app/providers/page_provider.dart';
import 'package:movie_stream_app/providers/wishlist_provider.dart';
import 'package:movie_stream_app/shared/theme.dart';
import 'package:movie_stream_app/widgets/favorite_card.dart';
import 'package:provider/provider.dart';

class FavoritPage extends StatelessWidget {

  const FavoritPage({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget content() {
      return Expanded(
        child: Container(
          color: kBackgroundColor,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: wishlistProvider.wishlist
                .map(
                  (movie) => FavoriteCard(movie),
                )
                .toList(),
          ),
        ),
      );
    }

        Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: kBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/ic_like_act.png',
                width: 74,
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                ' You don\'t have dream movie?',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Let\'s find your favorite movie',
                style: grey2TextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    pageProvider.currentIndex = 0;
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 24,
                    ),
                    backgroundColor: kRedColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Explore Store',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }


    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 30),
              child: Text(
                'My Favorite',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: medium,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            wishlistProvider.wishlist.length == 0 ? emptyWishlist() : content()
          ]),
        ));
  }
}
