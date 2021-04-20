import 'package:a_2_z_store/ui/products/productsListScreen.dart';
import 'package:a_2_z_store/widgets/brandsCategory/brandsCategoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopWomen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<BrandsCategoryProvider>(
        create: (context) => BrandsCategoryProvider(),
        child: Consumer<BrandsCategoryProvider>(
          builder: (context, brandsCategoryProvider, _) {
            if ((brandsCategoryProvider.list != null)) {
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
                                      .navigation[1]
                                      .children[3]
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
                                      "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bW9kZWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
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
                                      .navigation[1]
                                      .children[3]
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
                                      "https://images.unsplash.com/photo-1596015301017-471ad3599a30?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTE3fHxtb2RlbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Dresses',
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
                                      .navigation[1]
                                      .children[3]
                                      .children[2]
                                      .children[1]
                                      .children[11]
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
                                      "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dG9wJTIwd2VhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Tops',
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

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
