import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));

  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getIt.get<ApiServices>()),
  );
}
