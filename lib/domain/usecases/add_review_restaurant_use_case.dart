import 'package:tuple/tuple.dart';

import '../../core/usecases/pram_usecase.dart';
import '../entities/customer_review.dart';
import '../repositories/restaurant_repository.dart';

class AddReviewUseCase
    extends ParamUseCase<List<CustomerReview>, Tuple3<String, String, String>> {
  final RestaurantRepository _repo;
  AddReviewUseCase(this._repo);

  @override
  Future<List<CustomerReview>> execute(Tuple3 params) {
    return _repo.addReviewRestaurant(params.item1, params.item2, params.item3);
  }
}
