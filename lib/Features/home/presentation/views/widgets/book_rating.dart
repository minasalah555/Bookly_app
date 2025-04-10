import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          fill: 1,
          size: 14,
        ),
        SizedBox(width: 8),
        Text('4.8', style: Styles.textStyle16),
        SizedBox(width: 6),
        Opacity(
          opacity: 0.5,
          child: Text(
            '(2450)',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
