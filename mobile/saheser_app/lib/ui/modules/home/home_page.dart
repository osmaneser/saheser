import 'package:flutter/material.dart';
import 'package:saheser_app/core/constants/global_constants.dart';
import 'package:saheser_app/core/constants/size_constant.dart';
import 'package:saheser_app/core/widgets/image/oe_custom_content_image.dart';
import 'package:saheser_app/core/widgets/oe_custom_content_text.dart';
import 'package:saheser_app/ui/modules/category/category_horizontal.dart';
import 'package:saheser_app/ui/modules/our_choose/our_choose_list_widget.dart';
import 'package:saheser_app/ui/modules/product/product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            backgroundColor: Colors.transparent,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(600, 200), bottomRight: Radius.elliptical(600, 200),),
                  color: GlobalConstant.alternativeLive
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                        children: <Widget>[
                          Spacer(),
                          CircleAvatar(
                            radius: 54.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                              "assets/images/logo3.png",
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(height: SizeConstants.size16,),
                      CustomContentText(text: "Dededen Toruna 70 Yıllık Damak Zevki")
                  ],
                ),
              ),

            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, i) {
            return Padding(
              padding: const EdgeInsets.all(SizeConstants.size8),
              child: Column(
                children: [
                  SizedBox(height: SizeConstants.size16,),
                  CategoryHorizontal(),
                  SizedBox(height: SizeConstants.size16,),
                  OurChooseListWidget(),
                  SizedBox(height: SizeConstants.size16,),
                  ProductList()
                ],
              ),
            );
          }, childCount: 1))
        ],
      ),
      // body: Center(
      //   child: ListView(
      //     children: [
      //       CategoryHorizontal(),
      //       OurChooseListWidget(),
      //       ProductList()
      //     ],
      //   ),
      // ),
    );
  }
}
