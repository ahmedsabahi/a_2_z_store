import 'package:a_2_z_store/widgets/brandsCategory/men.dart';
import 'package:a_2_z_store/widgets/brandsCategory/women.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  TabController _tabController;

  final List<Tab> listTab = [
    Tab(text: 'Men'),
    Tab(text: 'Women'),
    Tab(text: 'Kids'),
  ];

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: listTab.length, vsync: this);

    return DefaultTabController(
      length: 3,
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
            padding: const EdgeInsets.all(8.0),
            child: IndexedStack(
              children: [
                TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Men(),
                    Women(),
                    Text("kids"),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

// categoriesList.children
//     .map(
// (e) => Padding(
// padding: const EdgeInsets.all(5.0),
// child: Text(
// e.content.title,
// style: TextStyle(fontSize: 15),
// ),
// ),
// )
// .toList(),
