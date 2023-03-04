import 'package:get/get.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';
import 'package:restaurant_app/domain/usecases/fetch_restaurant_use_case.dart';

import '../../data/providers/network/api_provider.dart';
import '../ui/global_widgets/message_dialog.dart';

class HomeController extends GetxController {
  final FetchRestaurantsUseCase _fetchRestaurantsUseCase;

  HomeController(this._fetchRestaurantsUseCase);

  @override
  void onInit() {
    getRestaurant().then((_) => super.onInit());
  }

  final listRestaurants = <Restaurant>[].obs;
  final listFoundRestaurants = <Restaurant>[].obs;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  String? messageError;

  Future<void> getRestaurant() async {
    if (!isLoading) {
      try {
        onLoading();
        listRestaurants.value = await _fetchRestaurantsUseCase.execute();
        listFoundRestaurants.value = listRestaurants;
        messageError = null;
        onLoadingDone();
      } on AppException catch (e) {
        onLoadingDone();
        messageError = e.details.toString();
        Get.dialog(
          DialogMessage(
            status: false,
            desc: e.details,
          ),
        );
      }
    }
  }

  void searchRestaurant(String query) {
    List<Restaurant> result = [];
    if (query.isEmpty) {
      result = listRestaurants;
    } else {
      result = listRestaurants
          .where((restaurant) =>
              restaurant.name.toLowerCase().contains(query.toLowerCase()) ||
              restaurant.city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    listFoundRestaurants.value = result;
  }

  void onLoading() {
    _isLoading.value = true;
  }

  void onLoadingDone() {
    _isLoading.value = false;
  }
}
