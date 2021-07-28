import 'package:saheser_app/core/init/locator.dart';
import 'package:saheser_app/core/models/base_view_model.dart';
import 'package:saheser_app/ui/models/category_model.dart';
import 'package:saheser_app/ui/repositories/main_repository.dart';

class HomeViewModel extends BaseViewModel {
  MainRepository _mainRepository = locator<MainRepository>();

}
