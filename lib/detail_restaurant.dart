import 'package:flutter/material.dart';
import 'data/model/restaurant.dart';
import 'data/model/route_argument.dart';

class DetailRestaurant extends StatefulWidget {
  static const routeName = '/detail_restaurant';

  const DetailRestaurant({Key? key}) : super(key: key);

  @override
  State<DetailRestaurant> createState() => _DetailRestaurantState();
}

class _DetailRestaurantState extends State<DetailRestaurant> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DetailRestaurantArguments;
    List<Food> foods = parseFoods(args.menus);
    List<Drink> drinks = parseDrinks(args.menus);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 500,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Hero(
                            tag: args.restaurant.pictureId,
                            child: Image.network(
                              args.restaurant.pictureId,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black26,
                                borderRadius:
                                    BorderRadius.only(topRight: Radius.circular(8)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      args.restaurant.name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                        Text(
                                          args.restaurant.city,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black26,
                                borderRadius:
                                    BorderRadius.only(topLeft: Radius.circular(8)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 17,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(args.restaurant.rating.toString(), style: const TextStyle(color: Colors.white),),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              args.restaurant.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 15,
                              style: TextStyle(color: Colors.grey[700], fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: MenusList(
          food: foods,
          drink: drinks,
        ),
      ),
    );
  }
}

class MenusList extends StatelessWidget {
  final List<Food> food;
  final List<Drink> drink;
  const MenusList({
    Key? key,
    required this.food,
    required this.drink,
  }) : super(key: key);

  SliverPersistentHeader _header(String text) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: SliverAppBarDelegate(
        minHeight: 45,
        maxHeight: 60,
        child: Container(
          color: Colors.white,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(color: Colors.grey[700], fontSize: 17,),
              ),
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _header('Makanan (${food.length})'),
        SliverList(
          delegate: SliverChildListDelegate(
            food.map(_buildTile).toList(),
          ),
        ),
        _header('Mainuman (${drink.length})'),
        SliverList(
          delegate: SliverChildListDelegate(
            drink.map(_buildTile).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTile(dynamic menus) {
    return ListTile(
      title: Text(
        menus.name,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
