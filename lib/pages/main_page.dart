import 'package:flutter/material.dart';
import 'package:movie_stream_app/pages/favotit_page.dart';
import 'package:movie_stream_app/pages/home_page.dart';
import 'package:movie_stream_app/pages/profile_page.dart';
import 'package:movie_stream_app/providers/movie_provider.dart';
import 'package:movie_stream_app/providers/page_provider.dart';
import 'package:movie_stream_app/shared/theme.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: kBackgroundColor2,
            currentIndex: pageProvider.currentIndex,
            onTap: (value) {
              print(value);
              pageProvider.currentIndex = value;
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 14,
                        bottom: 6,
                      ),
                      child: Image.asset(
                        'assets/ic_home.png',
                        width: 30,
                        color: pageProvider.currentIndex == 0
                            ? kRedColor
                            : kGreyColor,
                      ),
                    ),
                    pageProvider.currentIndex == 0
                        ? Container(
                            height: 6,
                            width: 14,
                            margin: EdgeInsets.only(
                              bottom: 2,
                            ),
                            decoration: BoxDecoration(
                                color: kRedColor,
                                borderRadius: BorderRadius.circular(40)),
                          )
                        : SizedBox(),
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 14,
                        bottom: 6,
                      ),
                      child: Image.asset(
                        'assets/ic_like.png',
                        width: 30,
                        color: pageProvider.currentIndex == 1
                            ? kRedColor
                            : kGreyColor,
                      ),
                    ),
                    pageProvider.currentIndex == 1
                        ? Container(
                            height: 6,
                            width: 14,
                            margin: EdgeInsets.only(
                              bottom: 2,
                            ),
                            decoration: BoxDecoration(
                                color: kRedColor,
                                borderRadius: BorderRadius.circular(40)),
                          )
                        : SizedBox(),
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 14,
                        bottom: 6,
                      ),
                      child: Image.asset(
                        'assets/ic_donwload.png',
                        width: 30,
                        color: pageProvider.currentIndex == 2
                            ? kRedColor
                            : kGreyColor,
                      ),
                    ),
                    pageProvider.currentIndex == 2
                        ? Container(
                            height: 6,
                            width: 14,
                            margin: EdgeInsets.only(
                              bottom: 2,
                            ),
                            decoration: BoxDecoration(
                                color: kRedColor,
                                borderRadius: BorderRadius.circular(40)),
                          )
                        : SizedBox(),
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 14,
                        bottom: 6,
                      ),
                      child: Image.asset(
                        'assets/ic_user.png',
                        width: 30,
                        color: pageProvider.currentIndex == 3
                            ? kRedColor
                            : kGreyColor,
                      ),
                    ),
                    pageProvider.currentIndex == 3
                        ? Container(
                            height: 6,
                            width: 14,
                            margin: EdgeInsets.only(
                              bottom: 2,
                            ),
                            decoration: BoxDecoration(
                                color: kRedColor,
                                borderRadius: BorderRadius.circular(40)),
                          )
                        : SizedBox(),
                  ],
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return FavoritPage();
          break;
        case 2:
          return HomePage();
          break;
        case 3:
          return ProfilePage();
          break;

        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
