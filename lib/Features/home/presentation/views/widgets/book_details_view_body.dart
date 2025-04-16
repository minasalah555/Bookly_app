import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/button_actions.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar_book_details.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/other_bookd_list_view.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              CustomBookDetailsSection(bookModel: book),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: BookDetailsSection(bookModel: book),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: SimilerBooksSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomBookDetailsSection extends StatelessWidget {
  const CustomBookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomAppBarBookDetails(),
          SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: FeatureListViewItem(
              imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
            ),
          ),
          SizedBox(height: 23),
        ],
      ),
    );
  }
}

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w600),
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 6),
        Text(
          bookModel.volumeInfo.authors![0],
          style: Styles.textStyle18.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w800,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        SizedBox(height: 6),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rate: bookModel.volumeInfo.contentVersion ?? '0',
          count: bookModel.volumeInfo.pageCount ?? 0,
        ),
        SizedBox(height: 20),
        ActionBook(book: bookModel),
        SizedBox(height: 20),
      ],
    );
  }
}

class SimilerBooksSection extends StatelessWidget {
  const SimilerBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'You can also like',
              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w900),
            ),
          ],
        ),
        SizedBox(height: 6),
        SimilerBooksListView(),
      ],
    );
  }
}
