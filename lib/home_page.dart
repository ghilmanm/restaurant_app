import 'package:flutter/material.dart';
import 'components/restaurant_list.dart';
import 'data/model/restaurant.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 50,
                left: 15,
              ),
              child: Text(
                'Restaurant',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 20,
                left: 15,
              ),
              child: Text(
                'Recommendation restaurant for you!',
              ),
            ),
            Flexible(
              child: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/restaurant.json'),
                builder: (context, snapshot) {
                  final List<Restaurant> restaurant =
                  parseRestaurants(snapshot.data);
                  return ListView.builder(
                    itemCount: restaurant.length,
                    itemBuilder: (context, index) {
                      return RestaurantList(
                        restaurant: restaurant[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
