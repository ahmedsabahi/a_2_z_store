import 'package:a_2_z_store/widgets/brandsCategory/brandsCategoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Men extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<BrandsCategoryProvider>(
        create: (context) => BrandsCategoryProvider(),
        child: Consumer<BrandsCategoryProvider>(
          builder: (context, brandsCategoryProvider, _) {
            return (brandsCategoryProvider.list != null)
                ? ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    itemCount:
                        brandsCategoryProvider.list.brands[0].children.length,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                    ),
                    itemBuilder: (context, index) {
                      final category =
                          brandsCategoryProvider.list.brands[0].children[index];
                      return ListTile(
                        title: Text(category.content.title),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
