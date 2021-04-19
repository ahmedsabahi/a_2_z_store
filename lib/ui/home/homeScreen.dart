import 'package:a_2_z_store/widgets/home_widgets/brand_list_stories_men.dart';
import 'package:a_2_z_store/widgets/home_widgets/brand_list_stories_women.dart';
import 'package:a_2_z_store/widgets/home_widgets/men_top.dart';
import 'package:a_2_z_store/widgets/home_widgets/new_men.dart';
import 'package:a_2_z_store/widgets/home_widgets/offers_men.dart';
import 'package:a_2_z_store/widgets/home_widgets/secoond_list.dart';
import 'package:a_2_z_store/widgets/home_widgets/men_categories.dart';
import 'package:a_2_z_store/widgets/home_widgets/women_catigories.dart';
import 'package:a_2_z_store/widgets/home_widgets/women_new.dart';
import 'package:a_2_z_store/widgets/home_widgets/women_offers.dart';
import 'package:a_2_z_store/widgets/home_widgets/women_top.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController _tabController;

  final List<Tab> listTab = [
    Tab(text: 'Women'),
    Tab(text: 'Men'),
  ];

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: listTab.length, vsync: this);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('A2Z Brands'),
          backgroundColor: Color(0xff363640),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            indicatorWeight: 4,
            indicatorColor: Colors.white,
            tabs: listTab,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(height: 150, child: BrandsListWomen()),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Categories",
                          style: TextStyle(
                              fontFamily: 'AirbnbCerealBold',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Container(height: 200, child: WomenCategories(),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Top trends",
                          style: TextStyle(
                              fontFamily: 'AirbnbCerealBold',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Container(height: 250, child: TopWomen()),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Offers for you",
                          style: TextStyle(
                              fontFamily: 'AirbnbCerealBold',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Container(height: 220, child: OffersWomen(),),
                      Container(height: 200, child: NewWomen(),),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 150, child: BrandsListMen()),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Categories",
                          style: TextStyle(
                              fontFamily: 'AirbnbCerealBold',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Container(height: 200, child: MenCategories(),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Top trends",
                          style: TextStyle(
                              fontFamily: 'AirbnbCerealBold',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Container(height: 250, child: TopMen(),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Offers for you",
                          style: TextStyle(
                              fontFamily: 'AirbnbCerealBold',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Container(height: 220, child: OffersMen(),),
                      Container(height: 200, child: NewMen(),),
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
