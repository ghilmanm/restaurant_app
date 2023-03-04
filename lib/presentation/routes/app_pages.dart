import 'package:restaurant_app/presentation/bindings/search_restaurant_binding.dart';
import 'package:restaurant_app/presentation/ui/pages/search_restaurant_page/search_restaurant_page.dart';

import '../bindings/detail_restaurant_binding.dart';
import '../ui/pages/detail_restaurant_page/detail_restaurant_page.dart';
import 'package:get/get.dart';

import '../bindings/home_binding.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/unknown_route_page/unknown_route_page.dart';
import 'app_routes.dart';

const _defaultTransition = Transition.native;

class AppPages {
  static final unknownRoutePage = GetPage(
    name: AppRoutes.UNKNOWN,
    page: () => const UnknownRoutePage(),
    transition: _defaultTransition,
  );

  static final List<GetPage> pages = [
    unknownRoutePage,
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.DETAIL_RESTAURANT,
      page: () => const DetailRestaurantPage(),
      binding: DetailRestaurantBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SEARCH_RESTAURANT,
      page: () => const SearchRestaurantPage(),
      binding: SearchRestaurantBinding(),
      transition: _defaultTransition,
    ),
  ];
}
