import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/customer_review.dart';
part 'customer_review_model.g.dart';

@JsonSerializable()
class CustomerReviewModel extends CustomerReview {
  CustomerReviewModel(
      {required String name, required String review, required String date})
      : super(name: name, review: review, date: date);
  factory CustomerReviewModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerReviewModelToJson(this);
}
