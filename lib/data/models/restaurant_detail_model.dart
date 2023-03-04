import '../../domain/entities/restaurant_detail.dart';
import 'category_model.dart';
import 'customer_review_model.dart';
import 'menus_model.dart';

class RestaurantDetailModel extends RestaurantDetail {
  RestaurantDetailModel(
      {required String id,
      required String name,
      required String description,
      required String city,
      required String address,
      required String pictureId,
      required List<CategoryModel> categories,
      required MenusModel menus,
      required double rating,
      required List<CustomerReviewModel> customerReviews})
      : super(
            id: id,
            name: name,
            description: description,
            city: city,
            address: address,
            pictureId: pictureId,
            categories: categories,
            menus: menus,
            rating: rating,
            customerReviews: customerReviews);

  @override
  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: List<CategoryModel>.from(
            json["categories"].map((x) => CategoryModel.fromJson(x))),
        menus: MenusModel.fromJson(json["menus"]),
        rating: json["rating"]?.toDouble(),
        customerReviews: List<CustomerReviewModel>.from(json["customerReviews"]
            .map((x) => CustomerReviewModel.fromJson(x))),
      );
}
