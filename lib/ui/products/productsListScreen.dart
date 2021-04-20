import 'package:a_2_z_store/models/favoriteList.dart';
import 'package:a_2_z_store/ui/products/productsListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatelessWidget {
  final int id;

  const ProductsList({
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
                    ),
                    itemBuilder: (BuildContext context, index) {
                      final pro = productsList[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Hero(
                          tag: pro.id,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      'https://${pro.imageUrl}',
                                    ),
                                  ),
                                ),
                              ),
                              Text(pro.name),
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
