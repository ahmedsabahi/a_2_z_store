import 'package:a_2_z_store/models/favoriteList.dart';
import 'package:a_2_z_store/ui/products/productsListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../productDetails/productDetailsProvider.dart';

class FavoriteScreen extends StatelessWidget {
  final Set _saved = new Set();

  FavoriteScreen({
    Key key,
  }) : super(key: key);

  int discountFormula(double previous, double current) {
    return ((current / previous) * 100 - 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    List<String> id = FavoriteList().ids;
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
        backgroundColor: Color(0xff363640),
      ),
      body: ChangeNotifierProvider<FavoriteList>(
        create: (context) => FavoriteList(),
        child: Consumer<FavoriteList>(
          builder: (context, favoriteList, _) {
            return ListView.builder(
                controller: favoriteList.scrollController,
                itemCount: favoriteList.ids.length,
                itemBuilder: (BuildContext context, index) {
                  final pro = favoriteList.ids[index];
                  return ChangeNotifierProvider<ProductDetailsProvider>(
                    create: (context) => ProductDetailsProvider(int.parse(pro)),
                    child: Consumer<ProductDetailsProvider>(
                      builder: (context, productDetailsProvider, child) {
                        final item = productDetailsProvider.data;
                        return (productDetailsProvider.data != null)
                            ? Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Hero(
                                          tag: item.id,
                                          child: Container(
                                            width: 80,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  'https://${item.media.images[0].url}',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            (item.price.current.value ==
                                                        item.price.previous
                                                            .value &&
                                                    item.price.current.value !=
                                                        null)
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8.0),
                                                    child: Text(
                                                      "\$${item.price.current.value}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2
                                                          .copyWith(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '\$${item.price.previous.value}',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .subtitle2
                                                              .copyWith(
                                                                  color: Colors
                                                                      .black,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                  fontSize: 13),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 8.0),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "\$${item.price.current.value}  ",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .subtitle2
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .red,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                              ),
                                                              Text(
                                                                "(${discountFormula(item.price.previous.value, item.price.current.value)}%)",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .subtitle2
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .red,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                            Row(
                                              children: [
                                                Icon(Icons.delete_forever,
                                                    size: 20),
                                                Text(
                                                  " Remove",
                                                ),
                                                VerticalDivider(),
                                                Icon(Icons.add_shopping_cart,
                                                    size: 20),
                                                Text(
                                                  " Move to Cart",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Center(child: CircularProgressIndicator());
                      },
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
