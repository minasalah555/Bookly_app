import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouters.bookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            FeatureListViewItem(
              imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      bookModel.volumeInfo.title!,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGTSectraFineRegular,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    bookModel.volumeInfo.authors?[0] ?? '',
                    style: Styles.textStyle14,
                    maxLines: 1,
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      BookRating(
                        rate: bookModel.volumeInfo.contentVersion ?? '0',
                        count: bookModel.volumeInfo.pageCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
