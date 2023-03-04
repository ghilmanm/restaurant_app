import '../../domain/entities/menus.dart';
import 'category_model.dart';

class MenusModel extends Menus {
  MenusModel(
      {required List<CategoryModel> foods, required List<CategoryModel> drinks})
      : super(foods: foods, drinks: drinks);
  @override
  factory MenusModel.fromJson(Map<String, dynamic> json) => MenusModel(
        foods: List<CategoryModel>.from(
            json["foods"].map((x) => CategoryModel.fromJson(x))),
        drinks: List<CategoryModel>.from(
            json["drinks"].map((x) => CategoryModel.fromJson(x))),
      );
}
