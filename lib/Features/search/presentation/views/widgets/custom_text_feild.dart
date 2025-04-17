import 'package:bookly_app/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CutomTextFeild extends StatelessWidget {
  const CutomTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        BlocProvider.of<SearchBooksCubit>(context).fetchBook(item: value);
      },
      decoration: InputDecoration(
        hintText: 'search',
        hintStyle: TextStyle(fontSize: 18),
        suffixIcon: Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
        enabledBorder: customOutLineInputBorder(),
        focusedBorder: customOutLineInputBorder(),
      ),
    );
  }

  OutlineInputBorder customOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
