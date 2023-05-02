import 'package:flutter/material.dart';
import 'package:to_do_app/user_choice.dart';
import 'add_item_view.dart';
import 'menu_view.dart';
import 'orders_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddItemView()));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 30,
                      top: 20,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserChoice()));
                      },
                      child: Icon(
                        Icons.logout_outlined,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24),
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: TabBar(
                    controller: tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red,
                    ),
                    unselectedLabelColor: Colors.red,
                    tabs: [
                      Tab(text: 'Menu'),
                      Tab(text: 'My Order'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      MenuView(),
                      OrdersView(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
