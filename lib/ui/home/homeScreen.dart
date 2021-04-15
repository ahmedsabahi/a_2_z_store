import 'package:a_2_z_store/widgets/home_widgets/brand_list_stories_men.dart';
import 'package:a_2_z_store/widgets/home_widgets/brand_list_stories_women.dart';
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
          padding: EdgeInsets.all(16.0),
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(height: 200, child: BrandsListWomen()),
                Container(height: 200, child: BrandsListMen()),
              ],
            ),
        ),
      ),
    );
  }
}
