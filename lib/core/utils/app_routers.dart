import 'package:bookly_app/Features/Splash/presentation/views/splesh_view.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/manager/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const homeView = '/homeView';
  static const searchView = '/searchView';
  static const bookDetailsView = '/BookDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: homeView, builder: (context, state) => HomeView()),
      GoRoute(
        path: bookDetailsView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SimilerBooksCubit(getIt.get<HomeRepoImpl>()),
              child: BookDetailsView(book: state.extra as BookModel),
            ),
      ),
      GoRoute(path: searchView, builder: (context, state) => SearchView()),
    ],
  );
}
