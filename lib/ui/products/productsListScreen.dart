import 'package:a_2_z_store/models/favoriteList.dart';
import 'package:a_2_z_store/ui/productDetails/productDetailsScreen.dart';
import 'package:a_2_z_store/ui/products/productsListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatelessWidget {
  final int id;
  final Set _saved = new Set();

  ProductsList({
    Key key,
    @required this.id,
  }) : super(key: key);

  int discountFormula(double previous, double current) {
    return ((current / previous) * 100 - 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        backgroundColor: Color(0xff363640),
      ),
      body: ChangeNotifierProvider<ProductsListProvider>(
        create: (context) => ProductsListProvider(id),
        child: Consumer<ProductsListProvider>(
          builder: (context, productsListProvider, _) {
            final productsList = productsListProvider.list;
            return (productsListProvider.list != null)
                ? GridView.builder(
                    controller: productsListProvider.scrollController,
                    shrinkWrap: true,
                    itemCount: productsList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                        childAspectRatio: 2 / 3),
                    itemBuilder: (BuildContext context, index) {
                      final pro = productsList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              id: pro.id,
                            ),
                          ));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Hero(
                                  tag: pro.id,
                                  child: Image.network(
                                    'https://${pro.imageUrl}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "${pro.brandName}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: Colors.black54,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  13.0, 0.0, 10.0, 0.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  (pro.price.previous.value == null)
                                      ? Text(
                                          "${pro.price.current.text}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                        )
                                      : Column(
                                          children: [
                                            Text(
                                              "${pro.price.previous.text}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2
                                                  .copyWith(
                                                      color: Colors.black,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: 12),
                                            ),
                                            Text(
                                              "${pro.price.current.text}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                  ChangeNotifierProvider<FavoriteList>(
                                    create: (context) => FavoriteList(),
                                    child: Consumer<FavoriteList>(
                                      builder: (context, favoriteList, _) =>
                                          IconButton(
                                        icon: Icon(
                                          favoriteList
                                                  .isFavorite(pro.id.toString())
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                        ),
                                        iconSize: 25,
                                        autofocus: true,
                                        onPressed: () {
                                          favoriteList
                                              .toggle(pro.id.toString());
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
