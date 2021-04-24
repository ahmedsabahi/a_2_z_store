
import 'package:a_2_z_store/ui/products/productsListScreen.dart';
import 'package:a_2_z_store/widgets/brandsCategory/brandsCategoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NewMen extends StatelessWidget {
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
                                ProductsList(id: brandsCategoryProvider.list.navigation[0].children[4].children[1].children[1].children[0].link.categoryId),
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
                                image: NetworkImage("https://images.unsplash.com/photo-1505022610485-0249ba5b3675?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjN8fG1vZGVscyUyMG1lbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
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
