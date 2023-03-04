import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/restaurant.dart';
part 'restaurant_model.g.dart';

@JsonSerializable()
class RestaurantModel extends Restaurant {
  RestaurantModel(
      {required String id,
      required String name,
      required String description,
      required String pictureId,
      required String city,
      required double rating})
      : super(
            id: id,
            name: name,
            description: description,
            pictureId: pictureId,
            city: city,
            rating: rating);

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);
}
