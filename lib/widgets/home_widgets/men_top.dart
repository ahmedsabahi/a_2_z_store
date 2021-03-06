import 'package:a_2_z_store/ui/products/productsListScreen.dart';
import 'package:a_2_z_store/widgets/brandsCategory/brandsCategoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopMen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<BrandsCategoryProvider>(
        create: (context) => BrandsCategoryProvider(),
        child: Consumer<BrandsCategoryProvider>(
          builder: (context, brandsCategoryProvider, _) {
            if (brandsCategoryProvider.list != null) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[0]
                                      .children[4]
                                      .children[2]
                                      .children[1]
                                      .children[0]
                                      .link
                                      .categoryId),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 190,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1613129636600-80409eac1d07?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3dlYXRzaGlydHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'New Collection',
                                  style: TextStyle(
                                      color: Colors.white,
                                      //  fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[0]
                                      .children[4]
                                      .children[2]
                                      .children[1]
                                      .children[3]
                                      .link
                                      .categoryId),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 190,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1576526625665-849fbc418224?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGNvYXRzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Coats',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[0]
                                      .children[4]
                                      .children[2]
                                      .children[1]
                                      .children[4]
                                      .link
                                      .categoryId),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 190,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1612653705360-34f2a2e17098?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTZ8fHBhbnRzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Pants',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[0]
                                      .children[4]
                                      .children[2]
                                      .children[1]
                                      .children[7]
                                      .link
                                      .categoryId),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 190,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1551851987-9198c4d26a24?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHN1aXRzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Suits',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
