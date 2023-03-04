import '../entities/customer_review.dart';
import '../entities/restaurant.dart';
import '../entities/restaurant_detail.dart';

abstract class RestaurantRepository {
  Future<List<Restaurant>> fetchRestaurants();
  Future<RestaurantDetail> getDetailRestaurant(String id);
  Future<List<Restaurant>> searchRestaurant(String query);
  Future<List<CustomerReview>> addReviewRestaurant(
      String id, String name, String review);
}
