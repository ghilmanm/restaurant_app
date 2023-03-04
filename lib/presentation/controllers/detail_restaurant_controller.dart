import 'package:get/get.dart';
import 'package:restaurant_app/domain/usecases/add_review_restaurant_use_case.dart';
import 'package:restaurant_app/domain/usecases/get_detail_restaurant_use_case.dart';
import 'package:tuple/tuple.dart';

import '../../data/providers/network/api_provider.dart';
import '../../domain/entities/restaurant_detail.dart';
import '../ui/global_widgets/message_dialog.dart';
import '../ui/pages/detail_restaurant_page/add_review_dialog.dart';

class DetailRestaurantController extends GetxController {
  final GetDetailRestaurantUseCase _getDetailRestaurantUseCase;
  final AddReviewUseCase _addReviewUseCase;

  DetailRestaurantController(
      this._getDetailRestaurantUseCase, this._addReviewUseCase);

  @override
  void onInit() {
    idRestaurant = Get.arguments;
    getDetailRestaurant().then((_) => super.onInit());
  }

  final _detailRestaurant = Rxn<RestaurantDetail>();
  RestaurantDetail? get detailRestaurant => _detailRestaurant.value;
  late String idRestaurant;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  Future<void> getDetailRestaurant() async {
    if (!isLoading) {
      try {
        onLoading();
        _detailRestaurant.value =
            await _getDetailRestaurantUseCase.execute(idRestaurant);
        onLoadingDone();
      } on AppException catch (e) {
        onLoadingDone();
        Get.dialog(
          DialogMessage(
            status: false,
            desc: e.details,
          ),
        );
      } on Exception catch (e) {
        onLoadingDone();
        Get.dialog(
          DialogMessage(
            status: false,
            desc: e.toString(),
          ),
        );
      }
    }
  }

  Future<void> addReview() async {
    Map<String, dynamic>? params = await Get.dialog(
      const AddReviewDialog(),
    );
    if (params != null) {
      await addReviewRestaurantAPI(params['name'], params['review']);
    }
  }

  Future<void> addReviewRestaurantAPI(String name, String review) async {
    if (!isLoading) {
      try {
        onLoading();
        _detailRestaurant.value?.customerReviews =
            await _addReviewUseCase.execute(Tuple3(idRestaurant, name, review));
        _detailRestaurant.refresh;
        onLoadingDone();
        Get.dialog(
          const DialogMessage(
            status: true,
            desc: 'Review berhasil ditambahkan!',
          ),
        );
      } on AppException catch (e) {
        onLoadingDone();
        Get.dialog(
          DialogMessage(
            status: false,
            desc: e.details,
          ),
        );
      } on Exception catch (e) {
        onLoadingDone();
        Get.dialog(
          DialogMessage(
            status: false,
            desc: e.toString(),
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
