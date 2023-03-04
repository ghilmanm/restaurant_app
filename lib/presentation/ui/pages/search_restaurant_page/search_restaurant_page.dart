import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controllers/search_restaurant_controller.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/restaurant_list.dart';
import '../../global_widgets/restaurant_list_skeleton.dart';
import '../../utils/constant.dart';

class SearchRestaurantPage extends GetView<SearchRestaurantController> {
  const SearchRestaurantPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Restaurant'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) => controller.searchRestaurant(value),
                onSubmitted: (value) => controller.searchRestaurant(value),
                decoration: InputDecoration(
                  hintText: "Search Restaurant",
                  filled: true,
                  fillColor: secondColor,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Obx(() {
              if (controller.isLoading) {
                return Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) =>
                        const RestaurantListSkeleton(),
                  ),
                );
              }

              if (controller.messageError != null) {
                return Padding(
                  padding: EdgeInsets.all(12.0.h),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          '$imageAsset/undraw_warning.svg',
                          height: deviceHeight() * 0.3,
                        ),
                        SizedBox(height: 8.h),
                        Text(controller.messageError!),
                      ],
                    ),
                  ),
                );
              }

              if (controller.listFoundRestaurants.isEmpty) {
                return Column(
                  children: [
                    SizedBox(
                      height: deviceHeight() * 0.4,
                      child:
                          SvgPicture.asset('$imageAsset/undraw_searching.svg'),
                    ),
                    const Text(
                      'Restaurant Empty',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                );
              }

              return Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: controller.listFoundRestaurants.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RestaurantList(
                        ontap: () => Get.toNamed(AppRoutes.DETAIL_RESTAURANT,
                            arguments:
                                controller.listFoundRestaurants[index].id),
                        restaurant: controller.listFoundRestaurants[index],
                      );
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
