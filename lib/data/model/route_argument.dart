import 'package:restoran_app/data/model/restaurant.dart';

class DetailRestaurantArguments {
  final Restaurant restaurant;
  final Map<String, dynamic> menus;

  DetailRestaurantArguments(
    this.restaurant,
    this.menus,
  );
}
