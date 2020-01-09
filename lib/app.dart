import 'package:flutter/material.dart';
import 'package:xxflutter/bottom_navigation.dart';


class App extends StatefulWidget{
   @override
   State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App>{
    TabItem _currentTab = TabItem.red;
    Map<TabItem,GlobalKey<NavigatorState>> _navigatorKeys = {
      TabItem.red : GlobalKey<NavigatorState>(),
      TabItem.green : GlobalKey<NavigatorState>(),
      TabItem.blue : GlobalKey<NavigatorState>(),
    };
    void _selectTab(TabItem tabItem){
      if(tabItem == _currentTab){
        //pop to first route
         _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
      }else{
        setState(() {
          _currentTab = tabItem;
        });
      }
    }

    @override
    Widget build(BuildContext context) {
    // TODO: implement build
//       return Scaffold(
//          body: _buildBody(),
////          bottomNavigationBar: BottomNavigation(),
//       );
         return WillPopScope(
            onWillPop: () async{
              final isFirstRouteInCurrentTab =
                  !await _navigatorKeys[_currentTab].currentState.maybePop();
              if(isFirstRouteInCurrentTab){
                //if not on the 'main' tab
                if(_currentTab != TabItem.red){
                  // select 'main' tab
                  _selectTab(TabItem.red);
                  return false;
                }
              }
              //let system handle back button if we are on the first route
              return isFirstRouteInCurrentTab;
            },
            child: Scaffold(
              body: Stack(children: <Widget>[

              ],),
              bottomNavigationBar: BottomNavigation(
                currentTab: _currentTab,
                onSelectTab: _selectTab,
              ),
            ),
         );
    }

    Widget _buildOffstageNavigator(TabItem tabItem){
         //return a widget representing a page 返回代表页面的小部件
        return Offstage(

        );
    }

}