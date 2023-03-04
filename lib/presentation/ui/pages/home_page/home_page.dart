import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/presentation/routes/app_routes.dart';
import 'package:restaurant_app/presentation/ui/global_widgets/restaurant_list_skeleton.dart';
import '../../global_widgets/restaurant_list.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/home_controller.dart';
import '../../utils/constant.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      Text(
                        'Restaurant',
                        style: TextStyle(
                          fontSize: setFontSize(30),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('Recommendation restaurant for you!'),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 45.h,
                    width: 48.w,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 4,
                          color: Color(0x40000000),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () => Get.toNamed(AppRoutes.SEARCH_RESTAURANT),
                      icon: const Icon(Icons.search),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Obx(() {
              if (controller.isLoading) {
                return Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
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

              if (controller.listRestaurants.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        '$imageAsset/undraw_empty.svg',
                        height: deviceHeight() * 0.3,
                      ),
                      const Text('Data Restaurant Kosong'),
                    ],
                  ),
                );
              }

              return Expanded(
                child: RefreshIndicator(
                  onRefresh: () => controller.getRestaurant(),
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
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.getRestaurant(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
