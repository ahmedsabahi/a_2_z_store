import 'package:a_2_z_store/models/productDetails.dart';
import 'package:a_2_z_store/widgets/brandsCategory/brandsCategoryProvider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandsListWomen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<BrandsCategoryProvider>(
        create: (context) => BrandsCategoryProvider(),
        child: Consumer<BrandsCategoryProvider>(
          builder: (context, brandsCategoryProvider, _) {
            return (brandsCategoryProvider.list != null)
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        brandsCategoryProvider.list.brands[2].children.length,
                    itemBuilder: (ctx, index) {
                      final brand =
                          brandsCategoryProvider.list.brands[2].children[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    //Colors.deepPurple,
                                    Colors.white,
                                    Colors.deepOrangeAccent,
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(3.5),
                                child: Center(
                                    child: SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "https://images.unsplash.com/photo-1570215778416-399723c225d6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80"),
                                        ))),
                              ),
                            ),
                          ),
                          // Container(
                          //  width: 60,
                          Padding(
                            padding: const EdgeInsets.only(top: 7.0),
                            child: Container(
                              width: 77,
                              child: Center(
                                  child: AutoSizeText(
                                brand.content.title,
                                overflow: TextOverflow.ellipsis,
                                //maxLines: 1,
                                style: TextStyle(fontSize: 6),
                              )),
                            ),
                          ),
                          // ),
                        ],
                      );
                    })
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
