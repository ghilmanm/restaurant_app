import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/data/providers/network/api_endpoint.dart';

import '../../../domain/entities/restaurant.dart';

class RestaurantList extends StatelessWidget {
  final Restaurant restaurant;
  final VoidCallback ontap;
  const RestaurantList(
      {Key? key, required this.restaurant, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsetsDirectional.fromSTEB(20.h, 0, 20.h, 20.h),
        child: AspectRatio(
          aspectRatio: 4 / 1,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    '${APIEndpoint.dicodingimage}/small/${restaurant.pictureId}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              AspectRatio(
                aspectRatio: 8 / 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 4.h),
                            child: Text(
                              restaurant.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.black26,
                                size: 14,
                              ),
                              Text(
                                restaurant.city,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black26,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 17,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(restaurant.rating.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
