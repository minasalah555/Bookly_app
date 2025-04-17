import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/manager/best_seller_books_cubit/best_seller_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manager/featured_books_cubit/featured_book_cubit.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/simple_observed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  Bloc.observer = SimpleObserved();
  runApp(BokklyApp());
}

class BokklyApp extends StatelessWidget {
  const BokklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FeaturedBookCubit(getIt.get<HomeRepoImpl>())
                    ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create:
              (context) =>
                  BestSellerBooksCubit(getIt.get<HomeRepoImpl>())
                    ..fetchNewsetBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouters.router, // / route to go Splash view
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
