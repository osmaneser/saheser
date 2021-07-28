import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saheser_app/core/constants/size_constant.dart';
import 'package:saheser_app/core/extensions/size_extension.dart';
import 'package:saheser_app/core/widgets/image/oe_custom_circle_image.dart';
import 'package:saheser_app/core/widgets/oe_custom_card.dart';
import 'package:saheser_app/core/widgets/oe_custom_content_text.dart';
import 'package:saheser_app/core/widgets/oe_custom_title_text.dart';
import 'package:saheser_app/ui/modules/product/product_view_model.dart';
import 'package:saheser_app/ui/modules/widgets/saheser/product_detail_page_widget.dart';

class SingelFoodItemWidget extends StatelessWidget {
  final int id;
  final String imgUrl;
  final String name;
  final String categoryName;
  final double price;

  const SingelFoodItemWidget({Key? key, required this.imgUrl, required this.name, required this.categoryName, required this.price, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: SizeConstants.size8, right: SizeConstants.size8, bottom: SizeConstants.size8),
      child: GestureDetector(
        onTap: () async {
          var foodDetail = await Provider.of<ProductViewModel>(context, listen: false).getFoodDetail(id);
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
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 70,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(SizeConstants.size8))),
            child: Row(
              children: [
                Expanded(flex: 30, child: CustomCircleImage(imgUrl: imgUrl)),
                Expanded(
                    flex: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(flex: 20),
                        Expanded(flex: 25, child: CustomTitleText(text: name)),
                        Spacer(flex: 10),
                        Expanded(flex: 25, child: CustomContentText(text: categoryName)),
                        Spacer(flex: 20),
                      ],
                    )),
                Expanded(flex: 20, child: CustomTitleText(text: "$price ₺"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
