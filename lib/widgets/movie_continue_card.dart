import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../shared/theme.dart';

class MovieContinueCard extends StatelessWidget {
  const MovieContinueCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-movie');
      },
      child: Container(
        height: 114.0,
        width: 280,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(
          right: 12,
        ),
        decoration: BoxDecoration(
          color: kGreyColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                width: 90,
                height: 90,
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/img_continue1.png",
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: kWhiteColor.withOpacity(0.4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/ic_poly.png',
                          height: 18,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Avengers : End Game',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: whiteTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Minute 32 : 12',
                    style: grey2TextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  LinearPercentIndicator(
                    width: 120.0,
                    lineHeight: 10.0,
                    percent: 0.8,
                    padding: EdgeInsets.all(0),
                    barRadius: Radius.circular(2),
                    progressColor: kRedColor,
                    backgroundColor: kGrey2Color,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 12,
                height: 18,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/ic_other.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
