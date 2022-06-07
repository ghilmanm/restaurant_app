import 'dart:convert';

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late num rating;
  late Map<String, dynamic> menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  Restaurant.fromJson(Map<String, dynamic> restaurant) {
    id = restaurant['id'];
    name = restaurant['name'];
    description = restaurant['description'];
    pictureId = restaurant['pictureId'];
    city = restaurant['city'];
    rating = restaurant['rating'];
    menus = restaurant['menus'];
  }
}

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}

class Food{
  late String name;
  Food({required name});
  Food.fromMenus(Map<String, dynamic> food) {
    name = food['name'];
  }
}

List<Food> parseFoods(Map<String, dynamic> menus) {
  if (menus['foods'] == null) {
    return [];
  }
  final List parsed = menus['foods'];
  return parsed.map((menus) => Food.fromMenus(menus)).toList();
}

class Drink{
  late String name;
  Drink({required name});
  Drink.fromMenus(Map<String, dynamic> drink) {
    name = drink['name'];
  }
}

List<Drink> parseDrinks(Map<String, dynamic> menus) {
  if (menus['drinks'] == null) {
    return [];
  }
  final List parsed = menus['drinks'];

  return parsed.map((menus) => Drink.fromMenus(menus)).toList();
}




