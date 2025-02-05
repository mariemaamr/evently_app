import 'package:evently/features/createEvent/create_event_screen.dart';
import 'package:evently/features/homeScreen/widgets/custom_tab%20_bar.dart';
import 'package:evently/features/homeScreen/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/themes/app_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(180),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 6,
                ),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back ✨",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "John Safwat",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(children: [
                          Icon(Icons.location_on_outlined,
                          color: Colors.white,),
                          Text("Cairo ,Egypt",
                          style: TextStyle(
                            color: Colors.white
                          ),),
                        ]),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/Vector.svg',
                          height: 24,
                          width: 24,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColors.primaryColor,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "EN",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 16),
            TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelColor: Colors.white,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: Colors.white70,
                    tabs: [
                      CustomTabBarItem(title: 'All', icon: Icons.location_searching_outlined , isSelected: true),
                      CustomTabBarItem(title: 'Sport', icon: Icons.sports_handball_sharp , isSelected: false),
                      CustomTabBarItem(title: 'Birthday', icon: Icons.cake , isSelected: false),
                      CustomTabBarItem(title: 'Birthday', icon: Icons.cake , isSelected: false),
                      CustomTabBarItem(title: 'Birthday', icon: Icons.cake , isSelected: false),
                      CustomTabBarItem(title: 'Birthday', icon: Icons.cake , isSelected: false)
                    ],
                  ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            EventList(events: [
              EventCard(
                date: "21 Nov",
                description: "This is a Birthday Party",
                image: 'assets/images/birthday.png',
              ),
              EventCard(
                date: "22 Nov",
                description: "Meeting for Updating Development Method",
                image: 'assets/images/meeting.png',
              ),
              EventCard(
                date: "22 Nov",
                description: "Meeting for Updating Development Method",
                image: 'assets/images/exhibtion.png',
              ),
            ]),
            Center(child: Text("Sport Events")),
            Center(child: Text("Birthday Events")),
            Center(child: Text("Music Events")),
            Center(child: Text("Conference Events")),
            Center(child: Text("Festival Events")),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          shape: CircleBorder(side: BorderSide(color: Colors.white, width: 5)),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CreateEvent(),
              ),
            );
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          currentIndex: selectedIndex,
          onTap: onBtnNavBarItem,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              activeIcon: Icon(Icons.location_on),
              label: "Maps",
            ),
            BottomNavigationBarItem(icon: SizedBox.shrink(), label: ""),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              activeIcon: Icon(Icons.favorite),
              label: "Likes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: "Person",
            ),
          ],
        ),
      ),
    );
  }

  void onBtnNavBarItem(int index) {
    if (index == 2) return;
    setState(() {
      selectedIndex = index;
    });
  }
}

class EventList extends StatelessWidget {
  final List<EventCard> events;

  EventList({required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return events[index];
      },
    );
  }
}

