import 'package:bookly_app/Features/Splash/presentation/views/splesh_view.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const homeView = '/homeView';
  static const bookDetailsView = '/BookDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: homeView, builder: (context, state) => HomeView()),
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) => BookDetailsView(),
      ),
    ],
  );
}
