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
  Future<List<Restaurant>> _getData() async {
    List<Restaurant> values = parseRestaurants(
        await DefaultAssetBundle.of(context)
            .loadString('assets/restaurant.json'));
    return values;
  }

  Future<void> _refresh() async {
    List<Restaurant> values = parseRestaurants(
        await DefaultAssetBundle.of(context)
            .loadString('assets/restaurant.json'));

    setState(() {
      Future.value(values);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Restaurant>>(
          future: _getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'You have error \n"${snapshot.error}"',
                  textAlign: TextAlign.center,
                ),
              );
            }
            if (snapshot.hasData) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
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
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                        left: 15,
                      ),
                      child: Text(
                        'Recommendation restaurant for you!',
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return RestaurantList(
                          restaurant: snapshot.data![index],
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("Tidak ada data"));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refresh,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
