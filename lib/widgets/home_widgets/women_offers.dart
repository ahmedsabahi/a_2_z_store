import 'package:a_2_z_store/ui/products/productsListScreen.dart';
import 'package:a_2_z_store/widgets/brandsCategory/brandsCategoryProvider.dart';
import 'package:a_2_z_store/widgets/home_widgets/triangle_shape.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OffersWomen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<BrandsCategoryProvider>(
        create: (context) => BrandsCategoryProvider(),
        child: Consumer<BrandsCategoryProvider>(
          builder: (context, brandsCategoryProvider, _) {
            if ((brandsCategoryProvider.list != null)) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductsList(
                                id: brandsCategoryProvider
                                    .list
                                    .navigation[1]
                                    .children[3]
                                    .children[0]
                                    .children[1]
                                    .children[1]
                                    .link
                                    .categoryId),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 -16 ,
                        height: 190,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            ClipRRect(
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1564485377539-4af72d1f6a2f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG1vZGVsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              width: 50,
                              height: 30,
                              foregroundDecoration: const BadgeDecoration(
                                badgeColor: Colors.red,
                                badgeSize: 60,
                                textSpan: TextSpan(
                                  text: 'SALE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'New lines',
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
                                    .navigation[1]
                                    .children[3]
                                    .children[6]
                                    .children[2]
                                    .children[0]
                                    .link
                                    .categoryId),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 -16,
                        height: 190,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            ClipRRect(
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://images.unsplash.com/flagged/photo-1518018424220-ab0c7b90a29c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHNwb3J0JTIwZ2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              width: 50,
                              height: 30,
                              foregroundDecoration: const BadgeDecoration(
                                badgeColor: Colors.red,
                                badgeSize: 60,
                                textSpan: TextSpan(
                                  text: 'SALE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Adidas',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
