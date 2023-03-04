import 'package:get/get.dart';
import 'package:restaurant_app/data/repositories/restaurant_repository.dart';
import 'package:restaurant_app/domain/usecases/search_restaurant_use_case.dart';
import '../controllers/search_restaurant_controller.dart';

class SearchRestaurantBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchRestaurantUseCase>(
        () => SearchRestaurantUseCase(Get.find<RestaurantRepositoryImpl>()));
    Get.lazyPut<SearchRestaurantController>(
        () => SearchRestaurantController(Get.find<SearchRestaurantUseCase>()));
    // Get.put<DetailRestaurantController>(DetailRestaurantController());
  }
}
