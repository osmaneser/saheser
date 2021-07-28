// To parse this JSON data, do
//
//     final resCategory = resCategoryFromJson(jsonString);

import 'dart:convert';

ResCategory resCategoryFromJson(String str) => ResCategory.fromJson(json.decode(str));

String resCategoryToJson(ResCategory data) => json.encode(data.toJson());

class ResCategory {
    
    int id;
    String name;
    String imgUrl;

    ResCategory({
        required this.name,
        required this.imgUrl,
        required this.id,
    });

    
    factory ResCategory.fromJson(Map<String, dynamic> json) => ResCategory(
        id: json["id"],
        name: json["name"],
        imgUrl: json["imgUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imgUrl": imgUrl,
    };
}
