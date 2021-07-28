import 'package:saheser_app/core/init/locator.dart';
import 'package:saheser_app/core/models/base_view_model.dart';
import 'package:saheser_app/ui/models/food_model.dart';
import 'package:saheser_app/ui/repositories/main_repository.dart';

class FoodListViewModel extends BaseViewModel {
  MainRepository _mainRepository = locator<MainRepository>();

  List<ResFood> listFood = [];

  Future<List<ResFood>> fetchFoodList() async {
    state = BaseState.Busy;
    var result = await _mainRepository.getFoodList();
    if (result.length > 0) {
      state = BaseState.Done;
      listFood = result;
      return listFood;
    } else {
      state = BaseState.Error;
      message = "Kategori Listesi Alınamadı";
      return listFood;
    }
  }
  
  Future<List<ResFood>> fetchFoodListByCategory(int categoryId) async {
    state = BaseState.Busy;
    var result = await _mainRepository.fetchFoodListByCategory(categoryId);
    if (result.length > 0) {
      state = BaseState.Done;
      listFood = result;
      return listFood;
    } else {
      state = BaseState.Error;
      message = "Kategori Listesi Alınamadı";
      return listFood;
    }
  }
  
}
