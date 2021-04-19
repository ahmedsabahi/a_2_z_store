
import 'package:a_2_z_store/ui/products/productsListScreen.dart';
import 'package:a_2_z_store/widgets/brandsCategory/brandsCategoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MenCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ChangeNotifierProvider<BrandsCategoryProvider>(
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
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[3].children[1].children[1].link.categoryId),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://images.unsplash.com/photo-1483721310020-03333e577078?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8MjA3OTc1NXx8ZW58MHx8fHw%3D&dpr=1&auto=format&fit=crop&w=525&q=60"),
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),

                            ),
                            Container(
                                alignment: Alignment.center,
                                  child: Text(
                                    'Activewear',
                                    style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
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
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[3].children[1].children[3].link.categoryId),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://images.unsplash.com/photo-1583691690382-3996ddbb37c2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=303&q=80"),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),

                            ),
                            Container(
                                alignment: Alignment.center,
                                  child: Text(
                                    'Sweatshirts',
                                    style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.unsplash.com/photo-1616258734679-57e515f9cdc1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8amFja2V0c3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),

                          ),
                          Container(
                              alignment: Alignment.center,
                              child:  GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[3].children[1].children[4].link.categoryId),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Jackets',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.unsplash.com/photo-1556301590-319c5b2ac83d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGplYW5zfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),

                          ),
                          Container(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[3].children[1].children[5].link.categoryId),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Jeans',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.unsplash.com/photo-1588359348347-9bc6cbbb689e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHNoaXJ0c3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),

                          ),
                          Container(
                              alignment: Alignment.center,
                              child:  GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[3].children[1].children[11].link.categoryId),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Shirts',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[3].children[1].children[12].link.categoryId),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://images.unsplash.com/photo-1597169428688-254b4223ba7c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c2hvcnRzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),

                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Shorts',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[3].children[1].children[14].link.categoryId),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://images.unsplash.com/photo-1590426987415-5366b3feb642?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8c3VpdHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),

                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Suits',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[3].children[1].children[17].link.categoryId),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://images.unsplash.com/photo-1528151358198-569380ceb640?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3dpbXdlYXIlMjBtZW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),

                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'swimwear ',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[3].children[1].children[15].link.categoryId),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://images.unsplash.com/photo-1608202602184-17c1daa0dd63?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHQlMjBzaGlydHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),

                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'T-Shirts',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[4].children[1].children[0].link.categoryId),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2hvZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),

                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Footwear',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[4].children[1].children[2].link.categoryId),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://images.unsplash.com/photo-1549660299-31c4ea5f34c2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTV8fGJvb3RzJTIwbWVufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),

                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Boots',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[5].children[1].children[0].link.categoryId),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://images.unsplash.com/photo-1504473114289-43f5e302d6bb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGNhcHMlMjBtZW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),

                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Accessories',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductsList(id: brandsCategoryProvider.list.navigation[0].children[3].children[4].children[1].children[2].link.categoryId),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://images.unsplash.com/photo-1553062407-98eeb64c6a62?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGJhZ3N8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),

                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Bags',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
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
