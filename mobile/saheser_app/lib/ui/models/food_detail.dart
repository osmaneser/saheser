// To parse this JSON data, do
//
//     final resFoodDetail = resFoodDetailFromJson(jsonString);

import 'dart:convert';

ResFoodDetail resFoodDetailFromJson(String str) => ResFoodDetail.fromJson(json.decode(str));

String resFoodDetailToJson(ResFoodDetail data) => json.encode(data.toJson());

class ResFoodDetail {
    ResFoodDetail({
       required this.id,
       required this.name,
       required this.imgUrl,
       required this.categoryId,
       required this.price,
       required this.description,
       required this.prepare,
    });

    int id;
    String name;
    String imgUrl;
    int categoryId;
    double price;
    String description;
    String prepare;

    factory ResFoodDetail.fromJson(Map<String, dynamic> json) => ResFoodDetail(
        id: json["id"],
        name: json["name"],
        imgUrl: json["imgUrl"],
        categoryId: json["categoryId"],
        price: json["price"].toDouble(),
        description: json["description"],
        prepare: json["prepare"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imgUrl": imgUrl,
        "categoryId": categoryId,
        "price": price,
        "description": description,
        "prepare": prepare,
    };
}
