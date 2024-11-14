// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delivery/data/categories.dart';
import 'package:delivery/data/foodcategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final Function(bool) afterScrollResult;
  const HomePage({super.key, required this.afterScrollResult});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  bool _isvisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        //result : false
        if (_isvisible) {
          _isvisible = false;
          widget.afterScrollResult(_isvisible);
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        //result : true
        if (!_isvisible) {
          _isvisible = true;
          widget.afterScrollResult(_isvisible);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            length: 4,
            child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      floating: true,
                      snap: true,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kathmandu, Nepal",
                            style:
                                GoogleFonts.dancingScript(color: Colors.black),
                          ),
                          Icon(Icons.notification_important),
                        ],
                      ),
                      bottom: TabBar(
                        tabs: [
                          Tab(text: 'All'),
                          Tab(text: 'Pizza'),
                          Tab(text: 'Burger'),
                          Tab(text: 'chicken'),
                        ],
                        indicatorColor: Colors.red[900],
                        indicatorWeight: 10,
                      ),
                    ),
                  ];
                },
                body: TabBarView(children: [
                  //Tab-1
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.78,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 10),
                            itemCount: product.length,
                            itemBuilder: (context, index) {
                              return FoodCard(foodCategory: product[index]);
                            })
                      ],
                    ),
                  ),

                  //Tab-2
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.78,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 10),
                            itemCount: pizza.length,
                            itemBuilder: (context, index) {
                              return FoodCard(foodCategory: pizza[index]);
                            })
                      ],
                    ),
                  ),
                  // Tab-3
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.78,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemCount: burger.length,
                            itemBuilder: (context, index) {
                              return FoodCard(foodCategory: burger[index]);
                            })
                      ],
                    ),
                  ),
                  //Tab-4
                  SingleChildScrollView(
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: chicken.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.78,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          return FoodCard(foodCategory: chicken[index]);
                        }),
                  )
                ]))));
  }
}
