import 'package:dicoding_fundamental_restaurant/common/styles.dart';
import 'package:dicoding_fundamental_restaurant/data/model/restaurant.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail_page';

  final Restaurant restaurant;

  const DetailPage({super.key, required this.restaurant});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                  pinned: true,
                  expandedHeight: 250,
                  backgroundColor: secondaryColor,
                  elevation: 0,
                  surfaceTintColor: secondaryColor,
                  leading: const BackButton(
                    color: primaryColor,
                  ),
                  flexibleSpace: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
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
                              widget.restaurant.name,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: primaryColor,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        background: Image.network(
                          widget.restaurant.pictureId,
                          fit: BoxFit.cover,
                        ));
                  })),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$735',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Container(
                        color: Colors.black26,
                        padding: const EdgeInsets.all(8.0),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.collections,
                              color: Colors.white,
                            ),
                            Text(
                              '6 photos',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Dijual oleh',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Hero(tag: restaurant.pictureId, child: Image.network(restaurant.pictureId)),
      //       Padding(
      //         padding: const EdgeInsets.all(10),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               restaurant.description,
      //               style: Theme.of(context).textTheme.bodyMedium,
      //             ),
      //             const Divider(color: Colors.grey),
      //             Text(
      //               restaurant.name,
      //               style: Theme.of(context).textTheme.titleLarge,
      //             ),
      //             const Divider(color: Colors.grey),
      //             Text(
      //               'City: ${restaurant.city}',
      //               style: Theme.of(context).textTheme.bodySmall,
      //             ),
      //             const SizedBox(height: 10),
      //             Text(
      //               'Rating: ${restaurant.rating}',
      //               style: Theme.of(context).textTheme.bodySmall,
      //             ),
      //             const Divider(color: Colors.grey),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
