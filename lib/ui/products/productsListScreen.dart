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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("product List"),
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
                    padding: EdgeInsets.all(5.0),
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
                        child: Container(
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
                                    tag: pro.id,
                                    child: Image.network(
                                      'https://${pro.imageUrl}',
                                      fit: BoxFit.cover,
                                      // width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
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
                                        "${pro.brandName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    (pro.price.previous.value == null)
                                        ? Text(
                                            "${pro.price.current.text}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2
                                                .copyWith(color: Colors.black),
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
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        fontSize: 10),
                                              ),
                                              Text(
                                                "${pro.price.current.text}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2
                                                    .copyWith(
                                                        color: Colors.red),
                                              ),
                                            ],
                                          )
                                  ],
                                ),
                              )
                            ],
                          ),
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
