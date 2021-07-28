import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saheser_app/core/constants/size_constant.dart';
import 'package:saheser_app/core/models/base_view_model.dart';
import 'package:saheser_app/core/widgets/oe_custom_circular_spinner.dart';
import 'package:saheser_app/core/widgets/oe_custom_not_found_item.dart';
import 'package:saheser_app/core/widgets/oe_custom_title_text.dart';
import 'package:saheser_app/ui/modules/product/product_view_model.dart';
import 'package:saheser_app/ui/modules/widgets/saheser/product_detail_page_widget.dart';
import 'package:saheser_app/ui/modules/widgets/saheser/single_our_choose_widget.dart';

import 'our_choose_view_model.dart';

class OurChooseListWidget extends StatelessWidget {
  const OurChooseListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Consumer<OurChooseViewModel>(
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
                CustomTitleText(text: "Bizim Seçtiklerimiz"),
                SizedBox(
                  height: SizeConstants.size8,
                ),
                Row(
                  children: vModel.listFood.map((e) {
                    return GestureDetector(
                        onTap: () async {
                          var foodDetail = await Provider.of<ProductViewModel>(context, listen: false).getFoodDetail(e.id);
                          
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPageWidget(foodDetail: foodDetail,)));
                        },
                        child: SingleOurChooseWidget(imgUrl: e.imgUrl));
                  }).toList(),
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
