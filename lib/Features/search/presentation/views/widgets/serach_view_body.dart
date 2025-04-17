import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_text_feild.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SerachViewBody extends StatelessWidget {
  const SerachViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CutomTextFeild(),
          SizedBox(height: 16),
          Text('Serach Result', style: Styles.textStyle18),
          SizedBox(height: 16),

          Expanded(child: SearchListView()),
        ],
      ),
    );
  }
}

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: BestSellerListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is SearchBooksLoading) {
          return CustomLoadingWidget();
        } else if (state is SearchBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return Center(
            child: Text('NoThing !! ...', style: Styles.textStyle20),
          );
        }
      },
    );
  }
}
