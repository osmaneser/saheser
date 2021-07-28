import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saheser_app/core/constants/size_constant.dart';
import 'package:saheser_app/core/models/base_view_model.dart';
import 'package:saheser_app/core/widgets/oe_custom_circular_spinner.dart';
import 'package:saheser_app/core/widgets/oe_custom_not_found_item.dart';
import 'package:saheser_app/core/widgets/oe_custom_title_text.dart';
import 'package:saheser_app/ui/modules/category/category_view_model.dart';
import 'package:saheser_app/ui/modules/widgets/saheser/single_category_widget.dart';

class CategoryHorizontal extends StatelessWidget {
  const CategoryHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Consumer<CategoryViewModel>(
        builder: (context, vModel, child) {
          if (vModel.state == BaseState.Initial) {
            vModel.fetchCategoryList();
          }
          if (vModel.state == BaseState.Busy) {
            return OeCustomSpinner();
          } else if (vModel.state == BaseState.Done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitleText(text: "Kategoriler"),
                SizedBox(
                  height: SizeConstants.size8,
                ),
                Row(
                  children: vModel.listCategory.map((e) => SingleCategoryWidget(id: e.id, name: e.name, imgUrl: e.imgUrl)).toList(),
                ),
              ],
            );
          } else {
            return OeCustomNotFoundItem();
          }
        },
      ),
    );
  }
}
