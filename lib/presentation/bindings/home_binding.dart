import 'package:get/get.dart';
import 'package:restaurant_app/domain/usecases/fetch_restaurant_use_case.dart';
import '../../data/repositories/restaurant_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FetchRestaurantsUseCase>(
        () => FetchRestaurantsUseCase(Get.find<RestaurantRepositoryImpl>()));
    Get.lazyPut<HomeController>(
        () => HomeController(Get.find<FetchRestaurantsUseCase>()));
    // Get.put<HomeController>(HomeController());
  }
}
