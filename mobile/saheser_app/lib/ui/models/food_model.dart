import 'dart:convert';

ResFood resFoodFromJson(String str) => ResFood.fromJson(json.decode(str));

String resFoodToJson(ResFood data) => json.encode(data.toJson());

class ResFood {
    ResFood({
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
    String? description;
    String? prepare;

    factory ResFood.fromJson(Map<String, dynamic> json) => ResFood(
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
