import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"]?.toDouble(),
        menus: Menus.fromJson(json["menus"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
        "menus": menus.toJson(),
      };
}

class Menus {
  final List<Food> foods;
  final List<Drink> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}

class Drink {
  final String name;

  Drink({
    required this.name,
  });

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Food {
  final String name;

  Food({
    required this.name,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

List<Restaurant> parseRestaurant(String? jsonData) {
  if (jsonData == null) {
    return [];
  }

  final Map<String, dynamic> parsed = jsonDecode(jsonData);
  final List restaurants = parsed["restaurants"];
  return restaurants.map((json) => Restaurant.fromJson(json)).toList();
}
