import 'package:flutter/material.dart';
import 'package:movie_stream_app/shared/theme.dart';

class CastCard extends StatelessWidget {
  const CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70,
        margin: EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/img_cast1.png",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Center(
              child: Text(
                'Reese Withers',
                textAlign: TextAlign.center,
                style: whiteTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ));
  }
}
