import 'package:saheser_app/core/init/locator.dart';
import 'package:saheser_app/core/models/base_view_model.dart';
import 'package:saheser_app/ui/models/category_model.dart';
import 'package:saheser_app/ui/repositories/main_repository.dart';

class CategoryViewModel extends BaseViewModel {
  MainRepository _mainRepository = locator<MainRepository>();

  List<ResCategory> listCategory = [];

  Future<List<ResCategory>> fetchCategoryList() async {
    state = BaseState.Busy;
    var result = await _mainRepository.getCategoryList();
    if (result.length > 0) {
      state = BaseState.Done;
      listCategory = result;
      return listCategory;
    } else {
      state = BaseState.Error;
      message = "Kategori Listesi Alınamadı";
      return listCategory;
    }
  }
}
