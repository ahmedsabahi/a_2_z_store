import 'package:a_2_z_store/ui/productDetails/productDetailsProvider.dart';
import 'package:a_2_z_store/ui/productDetails/productDetailsSizeGuide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share/share.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int id;

  ProductDetailsScreen({
    Key key,
    @required this.id,
  }) : super(key: key);

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  double discountFormula(double previous, double current) {
    return ((current / previous) * 100 - 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<ProductDetailsProvider>(
        create: (context) => ProductDetailsProvider(id),
        child: Consumer<ProductDetailsProvider>(
          builder: (context, productDetailsProvider, child) {
            final item = productDetailsProvider.data;
            return (productDetailsProvider.data != null)
                ? DefaultTabController(
                    length: 2,
                    child: NestedScrollView(
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverAppBar(
                            actions: [
                              IconButton(
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Share.share(item.baseUrl,
                                      subject:
                                          'Look what I Found! ${item.name}');
                                },
                              )
                            ],
                            expandedHeight: 450.0,
                            floating: false,
                            pinned: true,
                            backgroundColor: Colors.black,
                            flexibleSpace: FlexibleSpaceBar(
                              centerTitle: true,
                              title: Text(
                                item.brand.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              background: CarouselSlider.builder(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 5),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 1000),
                                  autoPlayCurve: Curves.easeInOutBack,
                                  pauseAutoPlayOnTouch: true,
                                  aspectRatio: 1,
                                  viewportFraction: 1,
                                  height: MediaQuery.of(context).size.height,
                                ),
                                itemCount: item.media.images.length,
                                itemBuilder: (context, index, realIndex) {
                                  final images = item.media.images[index].url;
                                  return Image.network(
                                    'https://$images',
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                          ),
                        ];
                      },
                      body: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  (item.price.current.value ==
                                              item.price.previous.value &&
                                          item.price.current.value != null)
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: Text(
                                            "\$${item.price.current.value}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '\$${item.price.previous.value}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2
                                                    .copyWith(
                                                        color: Colors.black,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        fontSize: 13),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "\$${item.price.current.value}  ",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2
                                                          .copyWith(
                                                              color: Colors.red,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                    Text(
                                                      "(${discountFormula(item.price.previous.value, item.price.current.value)}%)",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2
                                                          .copyWith(
                                                              color: Colors.red,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                      size: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black45),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: InkWell(
                                  child: Text(
                                    "(Size guide)",
                                    style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsSizeGuide(),
                                    ));
                                  },
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Available sizes:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            letterSpacing: 1.4),
                                      ),
                                      DropdownButton(
                                        underline: Container(
                                          height: 2,
                                          color: Colors.black,
                                        ),
                                        value: productDetailsProvider
                                            .dropDownValue,
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        iconSize: 28,
                                        elevation: 20,
                                        isDense: true,
                                        hint: Text(
                                          "Size",
                                        ),
                                        onChanged: (dynamic newval) {
                                          productDetailsProvider
                                              .dropDown(newval);
                                        },
                                        items: item.variants.map((e) {
                                          return DropdownMenuItem(
                                            value: e.brandSize,
                                            child: Text(
                                              e.brandSize,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              Text(
                                'PRODUCT DETAILS',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: 1.4),
                              ),
                              Html(data: item.description),
                              Divider(),
                              Text(
                                'BRAND',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: 1.4),
                              ),
                              Html(data: item.brand.description),
                              Divider(),
                              (item.info.sizeAndFit == null)
                                  ? Container()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'SIZE & FIT',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              letterSpacing: 1.4),
                                        ),
                                        Html(data: item.info.sizeAndFit),
                                        Divider(),
                                      ],
                                    ),
                              Text(
                                'LOOK AFTER ME',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: 1.4),
                              ),
                              Html(data: item.info.careInfo),
                              Divider(),
                              Text(
                                'ABOUT ME',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: 1.4),
                              ),
                              Html(data: item.info.aboutMe),
                              Divider(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        icon: Icon(Icons.add_shopping_cart_rounded),
        label: const Text('Add to Cart'),
        backgroundColor: Colors.black,
      ),
    );
  }
}
