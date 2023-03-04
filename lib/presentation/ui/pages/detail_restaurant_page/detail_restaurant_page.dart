import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/presentation/ui/utils/constant.dart';
import '../../../../data/providers/network/api_endpoint.dart';
import '../../../controllers/detail_restaurant_controller.dart';

class DetailRestaurantPage extends GetView<DetailRestaurantController> {
  const DetailRestaurantPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Restaurant'),
      ),
      body: Obx(
        () {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.detailRestaurant == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    '$imageAsset/undraw_error.svg',
                    height: deviceHeight() * 0.3,
                  )
                ],
              ),
            );
          }

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        '${APIEndpoint.dicodingimage}/large/${controller.detailRestaurant?.pictureId}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    controller.detailRestaurant?.name ?? 'No Name',
                    style: styleTitle,
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: controller.detailRestaurant?.rating ?? 1,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20.h,
                        ),
                        itemSize: 18.h,
                        onRatingUpdate: (double value) {},
                      ),
                      SizedBox(width: 5.w),
                      Text(
                          '(${controller.detailRestaurant?.rating.toString() ?? '0'})')
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_city,
                        size: 24,
                        color: primaryColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${controller.detailRestaurant?.city} - ${controller.detailRestaurant?.address}",
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "  ${controller.detailRestaurant?.description ?? 'No desc'}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    // style: styleTitle,
                  ),
                  SizedBox(
                    height: 50.h,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(width: 5.w),
                      itemCount:
                          controller.detailRestaurant?.categories.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Chip(
                          label: Text(controller
                                  .detailRestaurant?.categories[index].name ??
                              'null'),
                        );
                      },
                    ),
                  ),
                  const Text(
                    'Makanan',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  Wrap(
                    spacing: 6.0,
                    children: List<Widget>.generate(
                      controller.detailRestaurant?.menus.foods.length ?? 0,
                      (int index) {
                        return Chip(
                          backgroundColor: secondColor,
                          label: Text(controller
                                  .detailRestaurant?.menus.foods[index].name ??
                              '-'),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Minuman',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  Wrap(
                    spacing: 6.0,
                    children: List<Widget>.generate(
                      controller.detailRestaurant?.menus.drinks.length ?? 0,
                      (int index) {
                        return Chip(
                          backgroundColor: secondColor,
                          label: Text(controller
                                  .detailRestaurant?.menus.drinks[index].name ??
                              '-'),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Reviews',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  ListView.builder(
                    itemCount:
                        controller.detailRestaurant?.customerReviews.length ??
                            0,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          isThreeLine: true,
                          leading: CircleAvatar(
                            backgroundColor: secondColor,
                            child: Text(controller.detailRestaurant!
                                .customerReviews[index].name[0]),
                          ),
                          title: Text(
                            controller.detailRestaurant?.customerReviews[index]
                                    .name ??
                                '-',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.detailRestaurant
                                        ?.customerReviews[index].review ??
                                    '-',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                controller.detailRestaurant
                                        ?.customerReviews[index].date ??
                                    '-',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addReview(),
        child: const Icon(Icons.reviews),
      ),
    );
  }
}
