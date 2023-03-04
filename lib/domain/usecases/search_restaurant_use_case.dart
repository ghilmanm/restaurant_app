import '../../core/usecases/pram_usecase.dart';
import '../entities/restaurant.dart';
import '../repositories/restaurant_repository.dart';

class SearchRestaurantUseCase extends ParamUseCase<List<Restaurant>, String> {
  final RestaurantRepository _repo;
  SearchRestaurantUseCase(this._repo);

  @override
  Future<List<Restaurant>> execute(String params) {
    return _repo.searchRestaurant(params);
  }
}
