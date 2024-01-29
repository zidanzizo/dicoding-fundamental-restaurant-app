import 'package:dicoding_fundamental_restaurant/common/styles.dart';
import 'package:dicoding_fundamental_restaurant/data/model/restaurant.dart';
import 'package:dicoding_fundamental_restaurant/presentation/ui/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';
  const HomePage({super.key});

  Widget _buildRestoItem(BuildContext context, Restaurant restaurant) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName, arguments: restaurant);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  restaurant.pictureId,
                  width: 120,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 14,
                        color: secondaryColor,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          restaurant.city,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        restaurant.rating.toString(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _buildTitleText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Restaurant',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            'Recommendation restauran for you',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black54,
                ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
            return ListView(
              children: [
                _buildTitleText(context),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return _buildRestoItem(context, restaurants[index]);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
