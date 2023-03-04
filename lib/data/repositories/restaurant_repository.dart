import '../../domain/entities/customer_review.dart';
import '../../domain/entities/restaurant.dart';
import '../../domain/entities/restaurant_detail.dart';
import '../../domain/repositories/restaurant_repository.dart';
import '../models/customer_review_model.dart';
import '../models/restaurant_detail_model.dart';
import '../models/restaurant_model.dart';
import '../providers/network/apis/restaurant_api.dart';

class RestaurantRepositoryImpl extends RestaurantRepository {
  @override
  Future<List<CustomerReview>> addReviewRestaurant(
      String id, String name, String review) async {
    final response = await RestaurantAPI.addReview(id, name, review).request();
    return List<CustomerReview>.from(response['customerReviews']
        .map((model) => CustomerReviewModel.fromJson(model)));
  }

  @override
  Future<List<Restaurant>> fetchRestaurants() async {
    final response = await RestaurantAPI.fetchRestaurants().request();
    return List<RestaurantModel>.from(response['restaurants']
        .map((model) => RestaurantModel.fromJson(model)));
  }

  @override
  Future<RestaurantDetail> getDetailRestaurant(String id) async {
    final response = await RestaurantAPI.fetchRestaurantDetail(id).request();
    return RestaurantDetailModel.fromJson(response['restaurant']);
  }

  @override
  Future<List<Restaurant>> searchRestaurant(String query) async {
    final response = await RestaurantAPI.searchRestaurant(query).request();
    return List<RestaurantModel>.from(response['restaurants']
        .map((model) => RestaurantModel.fromJson(model)));
  }
}
