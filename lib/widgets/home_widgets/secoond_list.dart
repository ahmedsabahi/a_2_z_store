
import 'package:a_2_z_store/ui/products/productsListScreen.dart';
import 'package:a_2_z_store/widgets/brandsCategory/brandsCategoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SecondList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ChangeNotifierProvider<BrandsCategoryProvider>(
          create: (context) => BrandsCategoryProvider(),
     child: Consumer<BrandsCategoryProvider>(
       builder: (context, brandsCategoryProvider, _) {
       return (brandsCategoryProvider.list != null)?
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                height: 220,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://images.unsplash.com/photo-1511556820780-d912e42b4980?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHNob2VzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductsList(id: brandsCategoryProvider.list.navigation[0].children[2].children[0].link.categoryId),
                                ),
                              );
                            },
                            child: Text(
                              "Jerusalem",
                              style: TextStyle(
                                  fontFamily: 'AirbnbCerealBold',
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductsList(id: brandsCategoryProvider.list.navigation[0].children[2].children[0].link.categoryId),
                                ),
                              );
                            },
                            child: Text(
                              "EXTRA 25% OFF",
                              style: TextStyle(
                                  fontFamily: 'AirbnbCerealBook',
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                height: 220,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://images.unsplash.com/flagged/photo-1518018424220-ab0c7b90a29c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHNwb3J0JTIwZ2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Jerusalem",
                            style: TextStyle(
                                fontFamily: 'AirbnbCerealBold',
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[0].children[0].children[0].link.categoryId),
                                ),
                              );
                            },
                            child: Text(
                              "UP TO 80% OFF",
                              style: TextStyle(
                                  fontFamily: 'AirbnbCerealBook',
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                height: 220,
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.rectangle
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://images.unsplash.com/photo-1526816619231-e426e697193e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bW9kZWxzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60-"),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Jerusalem",
                            style: TextStyle(
                                fontFamily: 'AirbnbCerealBold',
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[0].children[1].children[12].link.categoryId),
                                ),
                              );
                            },
                            child: Text(
                              "SALE Plus Size",
                              style: TextStyle(
                                  fontFamily: 'AirbnbCerealBook',
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )


           : Center(child: CircularProgressIndicator());
       },
     ),
      ),
    );
  }
}
