import 'package:get/get.dart';
import 'package:restaurant_app/domain/usecases/search_restaurant_use_case.dart';

import '../../data/providers/network/api_provider.dart';
import '../../domain/entities/restaurant.dart';
import '../ui/global_widgets/message_dialog.dart';

class SearchRestaurantController extends GetxController {
  final SearchRestaurantUseCase _searchRestaurantUseCase;

  SearchRestaurantController(this._searchRestaurantUseCase);

  final listFoundRestaurants = <Restaurant>[].obs;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  String? messageError;

  void searchRestaurant(String query) {
    switch (query) {
      case '':
        listFoundRestaurants.value = [];
        break;
      default:
        searchRestaurantAPI(query);
    }
  }

  Future<void> searchRestaurantAPI(String query) async {
    if (!isLoading) {
      try {
        onLoading();
        listFoundRestaurants.value =
            await _searchRestaurantUseCase.execute(query);
        messageError = null;
        onLoadingDone();
      } on AppException catch (e) {
        onLoadingDone();
        messageError = e.details;
        Get.dialog(
          DialogMessage(
            status: false,
            desc: e.details,
          ),
        );
      }
    }
  }

  void onLoading() {
    _isLoading.value = true;
  }

  void onLoadingDone() {
    _isLoading.value = false;
  }
}
