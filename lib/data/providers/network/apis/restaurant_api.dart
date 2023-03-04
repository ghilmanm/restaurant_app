import 'dart:io';

import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

enum RestaurantType {
  fetchRestaurants,
  fetchRestaurantDetail,
  searchRestaurant,
  addReview
}

class RestaurantAPI implements APIRequestRepresentable {
  final RestaurantType type;
  String? q;
  String? id;
  String? name;
  String? review;

  RestaurantAPI._(
      {required this.type, this.q, this.id, this.name, this.review});

  RestaurantAPI.fetchRestaurants()
      : this._(type: RestaurantType.fetchRestaurants);
  RestaurantAPI.fetchRestaurantDetail(String id)
      : this._(type: RestaurantType.fetchRestaurantDetail, id: id);
  RestaurantAPI.searchRestaurant(String query)
      : this._(type: RestaurantType.searchRestaurant, q: query);
  RestaurantAPI.addReview(String id, String name, String review)
      : this._(
            type: RestaurantType.addReview,
            id: id,
            name: name,
            review: review);

  @override
  String get endpoint => APIEndpoint.dicodingapi;

  @override
  String get path {
    switch (type) {
      case RestaurantType.fetchRestaurants:
        return "/list";
      case RestaurantType.fetchRestaurantDetail:
        return "/detail";
      case RestaurantType.searchRestaurant:
        return "/search";
      case RestaurantType.addReview:
        return "/review";
      default:
        return "";
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case RestaurantType.fetchRestaurants:
        return HTTPMethod.get;
      case RestaurantType.fetchRestaurantDetail:
        return HTTPMethod.get;
      case RestaurantType.searchRestaurant:
        return HTTPMethod.get;
      case RestaurantType.addReview:
        return HTTPMethod.post;
    }
  }

  @override
  Map<String, String> get headers {
    switch (type) {
      case RestaurantType.addReview:
        return {
          HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
        };
      default:
        return {HttpHeaders.contentTypeHeader: 'application/json'};
    }
  }

  @override
  Map<String, String> get query {
    switch (type) {
      case RestaurantType.searchRestaurant:
        return {"q": "$q"};
      default:
        return {HttpHeaders.contentTypeHeader: 'application/json'};
    }
  }

  @override
  get body {
    switch (type) {
      case RestaurantType.addReview:
        return 'id=$id&name=$name&review=$review';
      default:
        return null;
    }
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url {
    switch (type) {
      case RestaurantType.fetchRestaurantDetail:
        return '$endpoint$path/$id';
      default:
        return endpoint + path;
    }
  }
}
