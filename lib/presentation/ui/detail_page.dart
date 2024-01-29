import 'package:dicoding_fundamental_restaurant/common/styles.dart';
import 'package:dicoding_fundamental_restaurant/data/model/restaurant.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';

  final Restaurant restaurant;

  const DetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              _buildFlexibleAppBar(),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _locationAndRating(context),
                  const SizedBox(
                    height: 20,
                  ),
                  _description(context),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildFoodsGridView(context),
                  const Divider(
                    thickness: 1,
                    height: 40,
                  ),
                  _buildDrinksGridView(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildDrinksGridView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Minuman',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: restaurant.menus.drinks.length,
          itemBuilder: (context, index) {
            Drink drink = restaurant.menus.drinks[index];
            return _menuGridItem(drink, context, false);
          },
        ),
      ],
    );
  }

  Column _buildFoodsGridView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Menu',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Makanan',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: restaurant.menus.foods.length,
          itemBuilder: (context, index) {
            Food food = restaurant.menus.foods[index];
            return _menuGridItem(food, context, true);
          },
        ),
      ],
    );
  }

  SliverAppBar _buildFlexibleAppBar() {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 250,
      backgroundColor: secondaryColor,
      elevation: 0,
      surfaceTintColor: secondaryColor,
      leading: const BackButton(
        color: primaryColor,
      ),
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              centerTitle: true,
              titlePadding: EdgeInsets.zero,
              title: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: constraints.maxHeight < 80 ? Colors.transparent : Colors.black.withOpacity(0.6),
                width: double.infinity,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 100),
                  padding: constraints.maxHeight < 80 ? const EdgeInsets.symmetric(vertical: 16) : const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: primaryColor,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              background: Hero(
                tag: restaurant.pictureId,
                child: Image.network(
                  restaurant.pictureId,
                  fit: BoxFit.cover,
                ),
              ));
        },
      ),
    );
  }

  Widget _menuGridItem(dynamic menu, BuildContext context, bool isFood) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: secondaryColor.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: LayoutBuilder(builder: (context, constraints) {
              return Image.asset(
                isFood ? 'assets/images/food.jpg' : 'assets/images/drink.jpg',
                height: constraints.maxWidth > 280 ? 250 : 110,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Text(
              menu.name,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _description(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          restaurant.description,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.grey[800],
                fontSize: 11,
              ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget _locationAndRating(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                size: 18,
                color: secondaryColor,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  restaurant.city,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              size: 18,
              color: Colors.orange,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              restaurant.rating.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
