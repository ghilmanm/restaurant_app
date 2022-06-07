import 'package:flutter/material.dart';

import '../data/model/restaurant.dart';
import '../data/model/route_argument.dart';
import '../detail_restaurant.dart';

class RestaurantList extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantList({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailRestaurant.routeName,
          arguments: DetailRestaurantArguments(
            restaurant,
            restaurant.menus,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 40),
        child: AspectRatio(
          aspectRatio: 4 / 1,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Hero(
                  tag: restaurant.pictureId,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      restaurant.pictureId,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
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
                            padding: const EdgeInsets.only(bottom: 8),
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
