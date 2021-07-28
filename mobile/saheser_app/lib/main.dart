import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saheser_app/core/constants/global_constants.dart';
import 'package:saheser_app/ui/modules/home/home_page.dart';

import 'core/init/locator.dart';
import 'ui/modules/category/category_view_model.dart';
import 'ui/modules/foods/food_list_view_model.dart';
import 'ui/modules/home/home_view_model.dart';
import 'ui/modules/our_choose/our_choose_view_model.dart';
import 'ui/modules/product/product_view_model.dart';

void main() {
  setupLocator();
  runApp(
    MultiProvider(
      builder: (context, child) {
        return MyApp();
      },
      providers: [
        ChangeNotifierProvider(create: (context)=> locator<HomeViewModel>(),),
        ChangeNotifierProvider(create: (context)=> locator<CategoryViewModel>(),),
        ChangeNotifierProvider(create: (context)=> locator<OurChooseViewModel>(),),
        ChangeNotifierProvider(create: (context)=> locator<FoodListViewModel>(),),
        ChangeNotifierProvider(create: (context)=> locator<ProductViewModel>(),),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalConstant.mainBack,
        appBarTheme: AppBarTheme(
          backgroundColor: GlobalConstant.alternativeSoft,
        )
      ),
      home: HomePage()
    );
  }
}
