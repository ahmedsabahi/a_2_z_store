import 'package:a_2_z_store/models/favoriteList.dart';
import 'package:a_2_z_store/ui/products/productsListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../productDetails/productDetailsProvider.dart';

class FavoriteScreen extends StatelessWidget {

  final Set _saved = new Set();

  FavoriteScreen({
    Key key,
    // @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List <String> id = FavoriteList().ids;
    return Scaffold(
      appBar: AppBar(
        title: Text("product List"),
      ),
      body: ChangeNotifierProvider<FavoriteList>(
        create: (context) => FavoriteList(),
        child: Consumer<FavoriteList>(
          builder: (context, favoriteList, _) {
            return GridView.builder(
                   controller: favoriteList.scrollController,
                shrinkWrap: true,
                padding: EdgeInsets.all(5.0),
                itemCount: favoriteList.ids.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    childAspectRatio: 2 / 3),
                itemBuilder: (BuildContext context, index) {
                  final pro = favoriteList.ids[index];
                  return ChangeNotifierProvider<ProductDetailsProvider>(
                    create: (context) => ProductDetailsProvider(int.parse(pro)),
                    child: Consumer<ProductDetailsProvider>(
                      builder: (context, productDetailsProvider, child) {
                        final item = productDetailsProvider.data;
                        return (productDetailsProvider.data != null) ?
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                      alignment: Alignment.center,
                                      child: Hero(
                                        tag: item.id,
                                        child: Image.network(
                                          'https://${item.media.images[0].url}',
                                          fit: BoxFit.cover,
                                          // width: double.infinity,
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height *
                                              0.45,
                                        ),
                                      ),
                                    ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(9.0),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${item.brand.name}",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                (item.price.current.value ==
                                          item.price.previous.value &&
                                       item.price.current.value != null)
                                        ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0),
                                      child: Text(
                                        "\$${item.price.current.value}",
                                        style: Theme.of(context)
                                            .textTheme
                                             .subtitle2
                                          .copyWith(
                                                color: Colors.black,
                                                // fontSize: 20,
                                                 fontWeight: FontWeight.w600),
                                      ),
                                     ) :  Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                         children: [
                                           Text(
                                             '\$${item.price.previous.value}',
                                          style: Theme.of(context)
                                                .textTheme
                                                 .subtitle2
                                                .copyWith(
                                                     color: Colors.black,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                     fontSize: 12),
                                      ),
                                           Padding(
                                             padding:
                                                const EdgeInsets.only(top: 8.0),
                                             child: Text(
                                              "\$${item.price.current.value}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                   .subtitle2
                                                   .copyWith(
                                                       color: Colors.red,
                                                      // fontSize: 20,
                                                      fontWeight:
                                                         FontWeight.w600),
                                             ),
                                        ),
                                      ],
                                       ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ) : Center(child: CircularProgressIndicator());
                      },
                    )
                    ,
                  );
                }
            );
            //
          },
        ),
      ),
    );
  }
}
