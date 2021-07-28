import 'package:get_it/get_it.dart';
import 'package:saheser_app/ui/modules/category/category_view_model.dart';
import 'package:saheser_app/ui/modules/foods/food_list_view_model.dart';
import 'package:saheser_app/ui/modules/home/home_view_model.dart';
import 'package:saheser_app/ui/modules/our_choose/our_choose_view_model.dart';
import 'package:saheser_app/ui/modules/product/product_view_model.dart';
import 'package:saheser_app/ui/repositories/main_repository.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => MainRepository());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => CategoryViewModel());
  locator.registerLazySingleton(() => OurChooseViewModel());
  locator.registerLazySingleton(() => FoodListViewModel());
  locator.registerLazySingleton(() => ProductViewModel());
}
