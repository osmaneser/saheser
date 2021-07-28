import 'package:flutter/material.dart';
import 'package:saheser_app/core/widgets/image/oe_custom_circle_image.dart';
import 'package:saheser_app/core/widgets/oe_custom_card.dart';
import 'package:saheser_app/core/widgets/oe_custom_title_text.dart';
import 'package:saheser_app/ui/modules/foods/food_list_page_widget.dart';

class SingleCategoryWidget extends StatelessWidget {
  final int id;
  final String name;
  final String imgUrl;
  const SingleCategoryWidget({Key? key, required this.name, required this.imgUrl, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> FoodListPageWidget(categoryId: id))),
      child: Container(
        width: 100,
        height: 150,
        child: OeCustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Expanded(flex:8,child: CustomCircleImage(imgUrl: imgUrl)), Expanded(flex: 2, child: CustomTitleText(text: name))],
          ),
        ),
      ),
    );
  }
}
