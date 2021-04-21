import 'package:a_2_z_store/models/favoriteList.dart';
import 'package:a_2_z_store/ui/products/productsListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: Consumer<FavoriteList >(
    builder: (context, favoriteList, _) {

       var id ;
      final ids = favoriteList.ids.map((e) => e);
      return GridView.builder(
              controller: productsListProvider.scrollController,
              shrinkWrap: true,
              padding: EdgeInsets.all(5.0),
              itemCount: favoriteList.ids.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  childAspectRatio: 2 / 3),
              itemBuilder: (BuildContext context, index) {
                final pro = favoriteList.[index];
               return ChangeNotifierProvider<ProductsListProvider>(
              create: (context) => ProductsListProvider(int.parse(pro)),
               child: Consumer<ProductsListProvider >(
                     builder: (context, productsListProvider, _) {
                   final productsList = productsListProvider.list;
                return (productsListProvider.list != null)
                     ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Hero(
                                tag: productsList.id,
                                child: Image.network(
                                  'https://${pro.imageUrl}',
                                  fit: BoxFit.cover,
                                  // width: double.infinity,
                                  height: MediaQuery.of(context).size.height *
                                      0.45,
                                ),
                              ),
                            ),
                            ChangeNotifierProvider<FavoriteList>(
                              create: (context) => FavoriteList(),
                              child:  Consumer<FavoriteList>(
                                builder: (context, favoriteList, _) => Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                    child: IconButton(

                                      icon: Icon(favoriteList.isFavorite(pro.id.toString())
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      ),
                                      iconSize: 35,
                                      autofocus: true,
                                      highlightColor: Colors.red,
                                      hoverColor: Colors.pink,
                                      onPressed: () {
                                        favoriteList.toggle(pro.id.toString());
                                        print(favoriteList.isFavorite(pro.id.toString()));
                                        //  print(unlockedList.isUnlocked(pro.id.toString()));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                                      decoration: TextDecoration
                                          .lineThrough,
                                      fontSize: 10),
                                ),
                                Text(
                                  "${pro.price.current.text}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
      ),
    );
  }
}
