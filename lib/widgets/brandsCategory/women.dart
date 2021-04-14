import 'package:a_2_z_store/widgets/brandsCategory/brandsCategoryProvider.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Women extends StatelessWidget {
  // final x = [];
  // final elementX = <String, Object>{};
  // final elementY = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<BrandsCategoryProvider>(
        create: (context) => BrandsCategoryProvider(),
        child: Consumer<BrandsCategoryProvider>(
          builder: (context, brandsCategoryProvider, _) {
            // final alphabeticalOrder = brandsCategoryProvider
            //     .list.brands[2].children
            //     .map((e) => e.content.title.substring(0, 1).toUpperCase())
            //     .toSet()
            //     .toList();
            // final categoryGroupBy = brandsCategoryProvider
            //     .list.brands[2].children
            //     .map((e) => e.content.title.substring(0, 1).toUpperCase())
            //     .toList();
            // print(categoryGroupBy);
            // print(alphabeticalOrder);

            // for (int i = 0; i < alphabeticalOrder.length; i++) {
            //   for (int j = 0; j < categoryGroupBy.length; j++) {
            //     if (categoryGroupBy[j] == alphabeticalOrder[i]) {
            //       elementX[alphabeticalOrder[i]] = categoryGroupBy[j];
            //       j++;
            //     } else {
            //       continue;
            //     }
            //   }
            //   i++;
            // }
            // print(elementX);

            return (brandsCategoryProvider.list != null)
                ? ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    itemCount:
                        brandsCategoryProvider.list.brands[2].children.length,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                    ),
                    itemBuilder: (context, index) {
                      final category =
                          brandsCategoryProvider.list.brands[2].children[index];
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
