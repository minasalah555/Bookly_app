import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(FontAwesomeIcons.solidStar, color: Colors.yellow, fill: 1),
        SizedBox(width: 6),
        Text('4.8', style: Styles.textStyle16),
        SizedBox(width: 5),
        Text(
          '(2450)',
          style: Styles.textStyle14
              .copyWith(fontWeight: FontWeight.w300)
              .copyWith(color: Color(0xff707070)),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
