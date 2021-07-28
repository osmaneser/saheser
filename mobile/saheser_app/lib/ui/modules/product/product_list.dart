import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saheser_app/core/constants/size_constant.dart';
import 'package:saheser_app/core/models/base_view_model.dart';
import 'package:saheser_app/core/widgets/oe_custom_title_text.dart';
import 'package:saheser_app/ui/modules/category/category_view_model.dart';
import 'package:saheser_app/ui/modules/product/product_view_model.dart';
import 'package:saheser_app/ui/modules/widgets/saheser/singel_food_product_widget.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vModelCategory = Provider.of<CategoryViewModel>(context, listen: false);
    return Consumer<ProductViewModel>(
      builder: (context, vModel, child) {
        if (vModel.state == BaseState.Initial) {
          vModel.fetchFoodList();
        }
        if (vModel.state == BaseState.Busy) {
          return Text("sd");
        } else if (vModel.state == BaseState.Done) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitleText(text: "Daha Fazla"),
              SizedBox(height: SizeConstants.size8,),
              Column(
                children: vModel.listFood.where((element) => element.id % 5 == 2 && element.categoryId != 3 && element.categoryId != 4).take(10).map((e) {
                  var category = vModelCategory.listCategory.firstWhere((element) => element.id == e.categoryId);
                  return SingleFoodProductWidget(productId: e.id, imgUrl: e.imgUrl, name: e.name, categoryName: category.name, price: e.price);
                }).toList(),
              ),
            ],
          );
        } else {
          return Text("data");
        }
      },
    );
  }
}
