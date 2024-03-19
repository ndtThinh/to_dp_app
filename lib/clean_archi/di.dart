import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:to_dp_app/clean_archi/data/remote/api/post_api.dart';
import 'package:to_dp_app/clean_archi/data/remote/api/post_api_impl.dart';
import 'package:to_dp_app/clean_archi/domain/repository/post_repository.dart';
import 'package:to_dp_app/clean_archi/domain/usercase/post_usecae.dart';

import 'data/repository/post_repository_empl.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {
  getIt.init();

  //api
  getIt.registerLazySingleton<PostApi>(() => PostApiEmpl());
  //repo
  getIt.registerLazySingleton<PostRepository>(() => PostRepositoryEmpl());
  //use case
  getIt.registerLazySingleton<PostUseCase>(() => PostUseCase());
}
