import '../../core/usecases/no_param_usecase.dart';
import '../entities/restaurant.dart';
import '../repositories/restaurant_repository.dart';

class FetchRestaurantsUseCase extends NoParamUseCase {
  final RestaurantRepository _repo;
  FetchRestaurantsUseCase(this._repo);

  @override
  Future<List<Restaurant>> execute() {
    return _repo.fetchRestaurants();
  }
}
