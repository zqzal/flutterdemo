import 'package:flutter/material.dart';
import 'package:xxflutter/bottom_navigation.dart';


class App extends StatefulWidget{
   @override
   State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App>{

    TabItem currentTab = TabItem.red;

    void _selectTab(TabItem tabItem){
      setState(() {
         currentTab = tabItem;
      });
    }

    @override
    Widget build(BuildContext context) {
    // TODO: implement build
       return Scaffold(
          body: _buildBody(),
//          bottomNavigationBar: BottomNavigation(),
       );
    }

    Widget _buildBody(){
         //return a widget representing a page 返回代表页面的小部件
    }

}