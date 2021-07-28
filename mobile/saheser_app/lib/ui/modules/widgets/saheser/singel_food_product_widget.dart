import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saheser_app/core/widgets/image/oe_custom_content_image.dart';
import 'package:saheser_app/core/widgets/oe_custom_card.dart';
import 'package:saheser_app/core/widgets/oe_custom_content_text.dart';
import 'package:saheser_app/core/widgets/oe_custom_title_text.dart';
import 'package:saheser_app/ui/modules/product/product_view_model.dart';

import 'product_detail_page_widget.dart';

class SingleFoodProductWidget extends StatelessWidget {
  final int productId;
  final String imgUrl;
  final String name;
  final String categoryName;
  final double price;
  const SingleFoodProductWidget(
      {Key? key, required this.imgUrl, required this.name, required this.categoryName, required this.price, required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var foodDetail = await Provider.of<ProductViewModel>(context, listen: false).getFoodDetail(productId);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPageWidget(
              foodDetail: foodDetail,
            ),
          ),
        );
      },
      child: OeCustomCard(
        child: Column(
          children: [
            OeContentImage(path: imgUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTitleText(text: name),
                      CustomContentText(text: categoryName),
                    ],
                  ),
                  CustomTitleText(text: "$price ₺")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
