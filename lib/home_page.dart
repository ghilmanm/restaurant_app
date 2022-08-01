import 'package:flutter/material.dart';
import 'components/restaurant_list.dart';
import 'data/model/restaurant.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home_page';
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
        child: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/restaurant.json'),
          builder: (context, snapshot) {
            final List<Restaurant> restaurant =
                parseRestaurants(snapshot.data);
            return ListView.builder(
              shrinkWrap: true,
              itemCount: restaurant.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 30,
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
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 20,
                          left: 15,
                        ),
                        child: Text(
                          'Recommendation restaurant for you!',
                        ),
                      ),
                    ],
                  );
                }
                index -= 1;
                return RestaurantList(
                  restaurant: restaurant[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
