import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/service/data_service.dart';
import 'package:news_app/widget/news_item.dart';

class TabBarMenu extends StatefulWidget {
  final List<Article> articles;
  const TabBarMenu(this.articles, {Key? key}) : super(key: key);

  @override
  State<TabBarMenu> createState() => _TabBarMenuState();
}

/// To create the [AnimationController] in a [State] that only uses a single [AnimationController], mix in this class, then pass vsync: this to the animation controller constructor.
class _TabBarMenuState extends State<TabBarMenu>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'Business',
    ),
    const Tab(
      text: 'Entertainment',
    ),
    const Tab(
      text: 'General',
    ),
    const Tab(
      text: 'Health',
    ),
    const Tab(
      text: 'Science',
    ),
    const Tab(
      text: 'Sports',
    ),
    const Tab(
      text: 'Technology',
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: myTabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    News news = News();
    debugPrint((MediaQuery.of(context).size.height).toString());
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
            tabs: myTabs,
            controller: _tabController,
            labelColor: Colors.deepOrangeAccent,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BubbleTabIndicator(
              indicatorColor: Colors.black,
              indicatorHeight: 30,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),
            isScrollable: true,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: myTabs.map((Tab tab) {
                // get data asynchronously
                return FutureBuilder(
                  // data from the API is passed to future builder
                  future: news.getNewsByCategory(tab.text.toString()),
                  builder: (context, snapshot) => snapshot.hasData
                      ? _listNewsCategory(snapshot.data as List<Article>)
                      : const Center(child: CircularProgressIndicator()),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listNewsCategory(List<Article> articles) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => NewsItem(article: articles[index]),
        itemCount: articles.length,
      ),
    );
  }
}
