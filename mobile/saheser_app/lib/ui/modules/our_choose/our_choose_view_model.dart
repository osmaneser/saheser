import 'package:saheser_app/core/init/locator.dart';
import 'package:saheser_app/core/models/base_view_model.dart';
import 'package:saheser_app/ui/models/food_model.dart';
import 'package:saheser_app/ui/repositories/main_repository.dart';

class OurChooseViewModel extends BaseViewModel {
  MainRepository _mainRepository = locator<MainRepository>();

  List<ResFood> listFood = [];

  Future<List<ResFood>> fetchCategoryList() async {
    state = BaseState.Busy;
    var result = await _mainRepository.getOurChooseList();
    if (result.length > 0) {
      state = BaseState.Done;
      listFood = result;
      return listFood;
    } else {
      state = BaseState.Error;
      message = "Ürün Listesi Alınamadı";
      return listFood;
    }
  }
}
