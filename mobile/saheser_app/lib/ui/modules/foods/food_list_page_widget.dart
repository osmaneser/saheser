import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saheser_app/core/constants/custom_enums.dart';
import 'package:saheser_app/core/models/base_view_model.dart';
import 'package:saheser_app/core/widgets/oe_custom_circular_spinner.dart';
import 'package:saheser_app/core/widgets/oe_custom_not_found_item.dart';
import 'package:saheser_app/core/widgets/oe_headline_text.dart';
import 'package:saheser_app/ui/modules/category/category_view_model.dart';
import 'package:saheser_app/ui/modules/foods/food_list_view_model.dart';
import 'package:saheser_app/ui/modules/widgets/saheser/single_food_item_widget.dart';

class FoodListPageWidget extends StatelessWidget {
  final int categoryId;
  const FoodListPageWidget({Key? key, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryViewModel vModelCategory = Provider.of(context, listen: false);
    
          Provider.of<FoodListViewModel>(context, listen: false).fetchFoodListByCategory(categoryId);
    return Scaffold(
      appBar: AppBar(
        title: CustomHeadlineText(text: vModelCategory.listCategory.firstWhere((element) => element.id == categoryId).name,headline: HeadlineType.headline2,),
        centerTitle: true,
      ),
      body: Consumer<FoodListViewModel>(
        builder: (context, vModel, child) {
          if (vModel.state == BaseState.Busy) {
            return OeCustomSpinner();
          } else if (vModel.state == BaseState.Done) {
            return ListView(
              children: vModel.listFood.map((e) {
                var category = vModelCategory.listCategory.firstWhere((element) => element.id == e.categoryId);
                return SingelFoodItemWidget(id: e.id,imgUrl: e.imgUrl, name: e.name, categoryName: category.name, price: e.price);
              }).toList(),
            );
          } else {
            return OeCustomNotFoundItem();
          }
        },
      ),
    );
  }
}
