import 'package:flutter/material.dart';
import 'package:movie_stream_app/models/movie.dart';
import 'package:movie_stream_app/providers/wishlist_provider.dart';
import 'package:movie_stream_app/shared/shared_value.dart';
import 'package:movie_stream_app/shared/theme.dart';
import 'package:provider/provider.dart';

class FavoriteCard extends StatelessWidget {
  final MovieModel? movie;

  const FavoriteCard(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageBaseURL +
                    "w500" +
                    (movie!.backdropPath! ?? movie!.posterPath!)),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie!.title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    )),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Action',
                  style: grey2TextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setMovie(movie!);
            },
            child: Container(
              width: 46,
              height: 46,
              padding: EdgeInsets.all(6),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: kRedColor),
              child: Image.asset(
                'assets/ic_like_inact.png',
                width: 30,
                height: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
