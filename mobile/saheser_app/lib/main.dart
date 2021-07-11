import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saheser_app/ui/modules/home/home_page.dart';

import 'core/init/locator.dart';
import 'ui/modules/home/home_view_model.dart';

void main() {
  setupLocator();
  runApp(
    MultiProvider(
      builder: (context, child) {
        return MyApp();
      },
      providers: [
        ChangeNotifierProvider(create: (context)=> locator<HomeViewModel>(), child: HomePage(),),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage()
    );
  }
}
