import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/functions/launch_url.dart';
import 'package:bookly_app/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ActionBook extends StatelessWidget {
  const ActionBook({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const CustomButton(
            fontColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            title: 'Free',
            fontSize: 20,
          ),
          CustomButton(
            onPressed: () {
              customLaunchUrl(context, book.volumeInfo.previewLink);
            },

            fontColor: Colors.white,
            backgroundColor: const Color(0xffEF8360),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            title: getText(book),
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}

String getText(BookModel book) {
  if (book.volumeInfo.previewLink == null) {
    return 'Not Avalible';
  } else {
    return 'Free Preview';
  }
}
