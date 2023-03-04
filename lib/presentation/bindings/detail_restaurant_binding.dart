import 'package:get/get.dart';
import 'package:restaurant_app/data/repositories/restaurant_repository.dart';
import 'package:restaurant_app/domain/usecases/add_review_restaurant_use_case.dart';
import 'package:restaurant_app/domain/usecases/get_detail_restaurant_use_case.dart';
import '../controllers/detail_restaurant_controller.dart';

class DetailRestaurantBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetDetailRestaurantUseCase>(
        () => GetDetailRestaurantUseCase(Get.find<RestaurantRepositoryImpl>()));

    Get.lazyPut<AddReviewUseCase>(
        () => AddReviewUseCase(Get.find<RestaurantRepositoryImpl>()));

    Get.lazyPut<DetailRestaurantController>(() => DetailRestaurantController(
          Get.find<GetDetailRestaurantUseCase>(),
          Get.find<AddReviewUseCase>(),
        ));
    // Get.put<DetailRestaurantController>(DetailRestaurantController());
  }
}
