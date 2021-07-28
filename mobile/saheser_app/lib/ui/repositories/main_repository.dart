import 'dart:convert';
import 'dart:math';

import 'package:saheser_app/ui/models/category_model.dart';
import 'package:saheser_app/ui/models/food_detail.dart';
import 'package:saheser_app/ui/models/food_model.dart';
import 'package:yaml/yaml.dart';
import "package:flutter/services.dart" as svcString;

class MainRepository {
  // List<ResCategory> listCategory = [
  //   ResCategory(
  //       id: 1,
  //       name: "Ev Yemekleri",
  //       imgUrl:
  //           "https://img.freepik.com/free-photo/national-uzbek-pilaf-with-meat-cast-iron-skillet-wooden-table_127425-8.jpg?size=338&ext=jpg"),
  //   ResCategory(
  //       id: 2,
  //       name: "Kebaplar",
  //       imgUrl:
  //           "https://image.freepik.com/free-photo/kebab-platter-with-lamb-chicken-lula-tikka-kebabs-grilled-vegetables-with-red-onion-salad_141793-2251.jpg"),
  //   ResCategory(
  //       id: 3,
  //       name: "İçecekler",
  //       imgUrl: "https://image.freepik.com/free-photo/different-types-mojito-cocktail-dark-brown_93675-16775.jpg"),
  //   ResCategory(
  //       id: 4,
  //       name: "Çorbalar",
  //       imgUrl: "https://image.freepik.com/free-photo/soup-set-mushroom-lentil-pumpkin-tomato-chicken-top-view_141793-12552.jpg"),
  //   ResCategory(
  //       id: 5,
  //       name: "Tatlılar",
  //       imgUrl:
  //           "https://image.freepik.com/free-photo/side-view-traditional-turkish-dessert-baklava-with-pistachio-wooden-table_141793-3317.jpg"),
  //   ResCategory(
  //       id: 6, name: "Ara Yemekler", imgUrl: "https://image.freepik.com/free-photo/spicy-minced-pork-rice-black-plate_1150-23726.jpg"),
  //   ResCategory(
  //       id: 7,
  //       name: "Et Yemekleri",
  //       imgUrl: "https://image.freepik.com/free-photo/assorted-meat-kebab-with-onions-herbs-grilled-vegetables_140725-5629.jpg"),
  // ];

  // List<ResFoodDetail> listFoodWithDetail = [
  //   ResFoodDetail(
  //       id: 1,
  //       name: "Mevsim Salata",
  //       imgUrl: "https://img.freepik.com/free-photo/fresh-homemade-chicken-tacos-recipe-idea_53876-105982.jpg?size=338&ext=jpg",
  //       categoryId: 1,
  //       price: 10.33,
  //       description: "",
  //       prepare: ""),
  //   ResFoodDetail(
  //     id: 2,
  //     name: "Makarna",
  //     imgUrl: "https://img.freepik.com/free-photo/spaghetti-meatball-topped-with-parmesan-basil_53876-96866.jpg?size=338&ext=jpg",
  //     categoryId: 2,
  //     price: 10.33,
  //     description: "",
  //     prepare: "",
  //   ),
  //   ResFoodDetail(
  //     id: 3,
  //     name: "Kuru Fasulye",
  //     imgUrl: "https://media.istockphoto.com/photos/beans-soup-rioja-picture-id475841792?s=612x612",
  //     categoryId: 1,
  //     price: 10.33,
  //     description: "",
  //     prepare: "",
  //   ),
  //   ResFoodDetail(
  //     id: 4,
  //     name: "Makarna",
  //     imgUrl: "https://img.freepik.com/free-photo/spaghetti-meatball-topped-with-parmesan-basil_53876-96866.jpg?size=338&ext=jpg",
  //     categoryId: 2,
  //     price: 10.33,
  //     description: "",
  //     prepare: "",
  //   ),
  //   ResFoodDetail(
  //     id: 5,
  //     name: "Dürüm",
  //     imgUrl:
  //         "https://image.freepik.com/free-photo/side-view-doner-with-grilled-chicken-greens-lettuce-tomato-french-fries-table_141793-4881.jpg",
  //     categoryId: 3,
  //     price: 10.33,
  //     description: "",
  //     prepare: "",
  //   ),
  //   ResFoodDetail(
  //     id: 6,
  //     name: "Tavuk",
  //     imgUrl: "https://image.freepik.com/free-photo/christmas-table-served-with-turkey-decorated-with-bright-tinsel-candles_2829-18829.jpg",
  //     categoryId: 1,
  //     price: 10.33,
  //     description: "",
  //     prepare: "",
  //   ),
  //   ResFoodDetail(
  //     id: 7,
  //     name: "Pizza",
  //     imgUrl:
  //         "https://image.freepik.com/free-photo/front-view-chicken-pizza-with-bell-red-yellow-pepper-with-yellow-cherry-tomatoes_141793-4592.jpg",
  //     categoryId: 4,
  //     price: 10.33,
  //     description: "",
  //     prepare: "",
  //   )
  // ];

  // List<ResFood> listFood = [
  //   ResFood(
  //       id: 1,
  //       name: "Mevsim Salata",
  //       imgUrl: "https://img.freepik.com/free-photo/fresh-homemade-chicken-tacos-recipe-idea_53876-105982.jpg?size=338&ext=jpg",
  //       categoryId: 1,
  //       price: 10.33),
  //   ResFood(
  //       id: 2,
  //       name: "Makarna",
  //       imgUrl: "https://img.freepik.com/free-photo/spaghetti-meatball-topped-with-parmesan-basil_53876-96866.jpg?size=338&ext=jpg",
  //       categoryId: 2,
  //       price: 10.33),
  //   ResFood(
  //       id: 3,
  //       name: "Kuru Fasulye",
  //       imgUrl: "https://media.istockphoto.com/photos/beans-soup-rioja-picture-id475841792?s=612x612",
  //       categoryId: 1,
  //       price: 10.33),
  //   ResFood(
  //       id: 4,
  //       name: "Makarna",
  //       imgUrl: "https://img.freepik.com/free-photo/spaghetti-meatball-topped-with-parmesan-basil_53876-96866.jpg?size=338&ext=jpg",
  //       categoryId: 2,
  //       price: 10.33),
  //   ResFood(
  //       id: 5,
  //       name: "Dürüm",
  //       imgUrl:
  //           "https://image.freepik.com/free-photo/side-view-doner-with-grilled-chicken-greens-lettuce-tomato-french-fries-table_141793-4881.jpg",
  //       categoryId: 3,
  //       price: 10.33),
  //   ResFood(
  //       id: 6,
  //       name: "Tavuk",
  //       imgUrl:
  //           "https://image.freepik.com/free-photo/christmas-table-served-with-turkey-decorated-with-bright-tinsel-candles_2829-18829.jpg",
  //       categoryId: 1,
  //       price: 10.33),
  //   ResFood(
  //       id: 7,
  //       name: "Pizza",
  //       imgUrl:
  //           "https://image.freepik.com/free-photo/front-view-chicken-pizza-with-bell-red-yellow-pepper-with-yellow-cherry-tomatoes_141793-4592.jpg",
  //       categoryId: 4,
  //       price: 10.33)
  // ];

  List<ResFood> listFood = [];
  List<ResCategory> listCategories = [];

  getCategories() async {
    final data = await svcString.rootBundle.loadString('assets/data/categories.yaml');
    var doc = loadYaml(data);

    var result = json.encode(doc);
    var foodsJson = (json.decode(result));

    var resp = (foodsJson["categories"] as List)
        .map((e) => ResCategory.fromJson(e))
        .where((element) => element.id != 2 && element.id != 3)
        .toList();
    listCategories = resp;
  }

  getData() async {
    final data = await svcString.rootBundle.loadString('assets/data/foods.yaml');
    var doc = loadYaml(data);

    var result = json.encode(doc);
    var foodsJson = (json.decode(result));

    var resp = (foodsJson["foods"] as List)
        .map((e) => ResFood.fromJson(e))
        .where((element) => element.categoryId != 2 && element.categoryId != 3)
        .toList();
    listFood = resp;
  }

  Future<List<ResCategory>> getCategoryList() async {
    await getCategories();
    return listCategories;
  }

  Future<List<ResFood>> getOurChooseList() async {
    await getData();
    Random d = Random();
    return listFood
        .where((element) => element.id % (d.nextInt(9)+1) == 0 && (element.categoryId == 1 || element.categoryId == 6 || element.categoryId == 7))
        .take(6)
        .toList();
  }

  Future<List<ResFood>> getFoodList() async {
    await getData();
    return listFood;
  }

  Future<ResFood> getFoodDetail(int foodId) async {
    await getData();
    return listFood.firstWhere((element) => element.id == foodId);
  }

  Future<List<ResFood>> fetchFoodListByCategory(int categoryId) async {
    await getData();
    return listFood.where((element) => element.categoryId == categoryId).toList();
  }
}
