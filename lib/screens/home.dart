import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dock_mobile/blocs/setup/setup_bloc.dart';
import 'package:smart_dock_mobile/packages/fab/fab_bottom_app_bar.dart';
import 'package:smart_dock_mobile/repositories/product_repos.dart';
import 'package:smart_dock_mobile/screens/activity.dart';
import 'package:smart_dock_mobile/screens/setting.dart';
import 'package:smart_dock_mobile/screens/setup/setup.dart';

enum Page {
  Activity,
  Setting
}
class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _lastSelected = 0;

  Widget _buildPages(BuildContext context) {
    if (_lastSelected == Page.Activity.index) {
      return ActivityScreen();
    } 

    if (_lastSelected == Page.Setting.index) {
      return SettingScreen();
    } 

    return Container();
  }

  Widget _buildTitle(BuildContext context) {
    if (_lastSelected == Page.Activity.index) {
      return Text(
        'ACTIVITY',
        style: Theme.of(context).textTheme.headline,
      );
    }

    if (_lastSelected == Page.Setting.index) {
      return Text(
        'SETTING',
        style: Theme.of(context).textTheme.headline,
      );
    }

    return Text('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: _buildTitle(context),
        elevation: 0.5,
      ),
      body: Center(
        child: _buildPages(context),
      ),
      bottomNavigationBar: FABBottomAppBar(
        backgroundColor: Colors.white,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.menu),
          FABBottomAppBarItem(iconData: Icons.layers),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _loadSetupFlow,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).bottomAppBarColor,
        elevation: 2.0,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = index;
    });
  }

  void _loadSetupFlow() {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) {
        return BlocProvider<SetupBloc>(
          builder: (context) {
            return SetupBloc(
              productRepository: ProductRepository(),
            );
          },
          child: SetupScreen(),
        );
      })
    );
  }
}