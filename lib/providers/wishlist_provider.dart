import 'package:flutter/material.dart';
import 'package:movie_stream_app/models/movie.dart';

class WishlistProvider with ChangeNotifier {
  List<MovieModel> _wishlist = [];

  List<MovieModel> get wishlist => _wishlist;

  set wishlist(List<MovieModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setMovie(MovieModel product) {
    if (!isWishlist(product)) {
      _wishlist.add(product);
    } else {
      _wishlist.removeWhere((element) => element.id == product.id);
    }

    notifyListeners();
  }

  isWishlist(MovieModel product) {
    if (_wishlist.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
