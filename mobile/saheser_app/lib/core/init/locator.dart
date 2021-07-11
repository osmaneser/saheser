import 'package:get_it/get_it.dart';
import 'package:saheser_app/ui/modules/home/home_view_model.dart';
import 'package:saheser_app/ui/repositories/main_repository.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => MainRepository());
  locator.registerLazySingleton(() => HomeViewModel());
}
