import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saheser_app/core/constants/custom_enums.dart';
import 'package:saheser_app/core/constants/global_constants.dart';
import 'package:saheser_app/core/constants/size_constant.dart';
import 'package:saheser_app/core/widgets/image/oe_custom_content_image.dart';
import 'package:saheser_app/core/widgets/oe_custom_content_text.dart';
import 'package:saheser_app/core/widgets/oe_custom_title_text.dart';
import 'package:saheser_app/core/widgets/oe_headline_text.dart';
import 'package:saheser_app/ui/models/food_model.dart';
import 'package:saheser_app/ui/modules/category/category_view_model.dart';
import 'package:saheser_app/ui/modules/foods/food_list_page_widget.dart';

class ProductDetailPageWidget extends StatelessWidget {
  final ResFood foodDetail;

  const ProductDetailPageWidget({Key? key, required this.foodDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vModelCategory = Provider.of<CategoryViewModel>(context, listen: false);
    var category = vModelCategory.listCategory.firstWhere((element) => element.id == foodDetail.categoryId);

    return Scaffold(
      appBar: AppBar(
        title: CustomTitleText(
          text: foodDetail.name,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(SizeConstants.size8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              OeContentImage(
                path: foodDetail.imgUrl,
                borderRadius: BorderRadius.circular(SizeConstants.size8),
              ),
              SizedBox(
                height: SizeConstants.size16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodListPageWidget(categoryId: foodDetail.categoryId)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(SizeConstants.size8),
                    decoration: BoxDecoration(
                      color: GlobalConstant.alternativeSoft,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomTitleText(text: category.name),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConstants.size16,
              ),
              CustomHeadlineText(text: foodDetail.name, headline: HeadlineType.headline2),
              SizedBox(
                height: SizeConstants.size8,
              ),
              CustomContentText(text: foodDetail.description ?? ""),
              SizedBox(
                height: SizeConstants.size16,
              ),
              Align(alignment: Alignment.centerLeft, child: CustomTitleText(text: "Hazırlanış")),
              CustomContentText(text: foodDetail.prepare ?? ""),
              SizedBox(
                height: SizeConstants.size16,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomHeadlineText(text: "${foodDetail.price} ₺", headline: HeadlineType.headline1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
