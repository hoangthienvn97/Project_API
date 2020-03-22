import 'package:flutter/material.dart';
import '../company_infor/personnel_page.dart';
import '../company_infor/resignation_page.dart';
import '../company_infor/policy_page.dart';
import '../company_infor/company_page.dart';
import '../company_infor/checkIn_action.dart';
import '../value/strings.dart';

class DashboardScreen extends StatefulWidget {

  @override
  _DashboardScreenState createState() => new _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  
  PageController _pageController;
  int _page = 2;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView(
        children: [
          new Policy(Strings.dbscreen_policy),
          new Personnel(Strings.dbscreen_personnel),
          new CheckInAction(), //Cham cong
          new Resignation(Strings.dbscreen_resignation),
          new Company(Strings.dbscreen_cpny),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
            ),
        child: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.brightness_low,
                  color: Colors.grey,
                ),
                title: new Text(
                  Strings.dbscreen_policy,
                  style: new TextStyle(
                    color: Colors.blue,
                  ),
                )),
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.perm_contact_calendar,
                  color: Colors.grey,
                ),
                title: new Text(
                  Strings.dbscreen_personnel,
                  style: new TextStyle(
                    color: Colors.blue,
                  ),
                )),
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.refresh,
                  color: Colors.grey,
                ),
                title: new Text(
                  Strings.timekeeping,
                  style: new TextStyle(
                    color: Colors.blue,
                  ),
                )),
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.airplanemode_active,
                  color: Colors.grey,
                ),
                title: new Text(
                  Strings.dbscreen_resignation,
                  style: new TextStyle(
                    color: Colors.blue,
                  ),
                )),
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.business,
                  color: Colors.grey,
                ),
                title: new Text(
                  Strings.dbscreen_cpny,
                  style: new TextStyle(
                    color: Colors.blue,
                  ),
                )), 

          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }
}