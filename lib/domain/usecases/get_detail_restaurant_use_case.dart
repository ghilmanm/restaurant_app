import '../../core/usecases/pram_usecase.dart';
import '../entities/restaurant_detail.dart';
import '../repositories/restaurant_repository.dart';

class GetDetailRestaurantUseCase
    extends ParamUseCase<RestaurantDetail, String> {
  final RestaurantRepository _repo;
  GetDetailRestaurantUseCase(this._repo);

  @override
  Future<RestaurantDetail> execute(String params) {
    return _repo.getDetailRestaurant(params);
  }
}
