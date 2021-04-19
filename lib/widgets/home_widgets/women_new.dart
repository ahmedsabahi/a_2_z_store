
import 'package:a_2_z_store/ui/products/productsListScreen.dart';
import 'package:a_2_z_store/widgets/brandsCategory/brandsCategoryProvider.dart';
import 'package:a_2_z_store/widgets/home_widgets/triangle_shape.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NewWomen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ChangeNotifierProvider<BrandsCategoryProvider>(
        create: (context) => BrandsCategoryProvider(),
        child: Consumer<BrandsCategoryProvider>(
          builder: (context, brandsCategoryProvider, _) {
            if ((brandsCategoryProvider.list != null)) {
              return
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductsList(id: brandsCategoryProvider.list.navigation[1].children[3].children[1].children[1].children[0].link.categoryId),
                        ),
                      );
                    },
                    child: Container(
                      height: 220,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          ClipRRect(
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://cdn.pixabay.com/photo/2015/11/07/11/46/fashion-1031469__340.jpg"),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child:  Text(
                              'New In',
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27.0),
                            ),),
                        ],
                      ),
                    ),

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
