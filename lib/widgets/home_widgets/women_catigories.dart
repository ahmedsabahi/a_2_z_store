import 'package:a_2_z_store/ui/products/productsListScreen.dart';
import 'package:a_2_z_store/widgets/brandsCategory/brandsCategoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WomenCategories extends StatelessWidget {
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
                                      .children[4]
                                      .children[3]
                                      .children[1]
                                      .children[1]
                                      .link
                                      .categoryId),
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
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1609138273459-0c945e28fdbf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGFjdGl2ZXdlYXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Activewear',
                                  style: TextStyle(
                                      color: Colors.white,
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[1]
                                      .children[4]
                                      .children[3]
                                      .children[1]
                                      .children[2]
                                      .link
                                      .categoryId),
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
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1597133524931-67b0b6c9bfc3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8amFja2V0c3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Jackets',
                                  style: TextStyle(
                                      color: Colors.white,
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[1]
                                      .children[4]
                                      .children[3]
                                      .children[1]
                                      .children[4]
                                      .link
                                      .categoryId),
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
                                  image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2016/01/15/08/02/girl-1141279__340.jpg"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Dresses',
                                  style: TextStyle(
                                      color: Colors.white,
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[1]
                                      .children[4]
                                      .children[3]
                                      .children[1]
                                      .children[5]
                                      .link
                                      .categoryId),
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
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1553728437-e15abbe95e6b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8c3dlYXRzaGlydHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Sweatshirts',
                                  style: TextStyle(
                                      color: Colors.white,
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[1]
                                      .children[4]
                                      .children[3]
                                      .children[1]
                                      .children[6]
                                      .link
                                      .categoryId),
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
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8amVhbnN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Jeans',
                                  style: TextStyle(
                                      color: Colors.white,
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[1]
                                      .children[4]
                                      .children[3]
                                      .children[1]
                                      .children[12]
                                      .link
                                      .categoryId),
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
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1590894682026-b63db5766135?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fHNob3J0c3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Shorts',
                                    style: TextStyle(
                                        color: Colors.white,
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[1]
                                      .children[4]
                                      .children[3]
                                      .children[1]
                                      .children[13]
                                      .link
                                      .categoryId),
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
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1547116180-3872338a567b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fHNraXJ0c3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Skirts',
                                    style: TextStyle(
                                        color: Colors.white,
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[1]
                                      .children[4]
                                      .children[3]
                                      .children[1]
                                      .children[14]
                                      .link
                                      .categoryId),
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
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1609269623809-957fe18fe113?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHN1aXRzJTIwd29tYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Suits',
                                    style: TextStyle(
                                        color: Colors.white,
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[1]
                                      .children[4]
                                      .children[3]
                                      .children[1]
                                      .children[16]
                                      .link
                                      .categoryId),
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
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1445075788823-f907c29aae58?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3dpbXdlYXIlMjB3b21hbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Swimwear',
                                    style: TextStyle(
                                        color: Colors.white,
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[1]
                                      .children[4]
                                      .children[4]
                                      .children[1]
                                      .children[0]
                                      .link
                                      .categoryId),
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
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vdHdlYXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Footwear',
                                    style: TextStyle(
                                        color: Colors.white,
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[1]
                                      .children[4]
                                      .children[4]
                                      .children[1]
                                      .children[2]
                                      .link
                                      .categoryId),
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
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1522465915620-587f726cce8f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTQ1fHxib290c3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Boots',
                                    style: TextStyle(
                                        color: Colors.white,
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[1]
                                      .children[4]
                                      .children[5]
                                      .children[1]
                                      .children[0]
                                      .link
                                      .categoryId),
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
                                  image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2016/11/29/11/09/woman-1869116__340.jpg"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Accessories',
                                    style: TextStyle(
                                        color: Colors.white,
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsList(
                                  id: brandsCategoryProvider
                                      .list
                                      .navigation[1]
                                      .children[4]
                                      .children[5]
                                      .children[1]
                                      .children[2]
                                      .link
                                      .categoryId),
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
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1523779105320-d1cd346ff52b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmFnc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Bags',
                                    style: TextStyle(
                                        color: Colors.white,
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
