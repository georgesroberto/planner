import 'package:flutter/material.dart';
import 'package:planner/components/custom_bottom_nav_bar.dart';
import 'package:planner/screens/transact_screen.dart';
import 'package:planner/screens/plan_details_screen.dart';
import 'package:planner/screens/records_screen.dart';
import 'package:planner/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2; // Starting with Home tab

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (_currentIndex) {
      case 0:
        Navigator.of(context).pushReplacementNamed(TransactScreen.routeName);
        break;
      case 1:
        Navigator.of(context).pushReplacementNamed(PlanDetailsScreen.routeName);
        break;
      case 2:
        break;
      case 3:
        Navigator.of(context).pushReplacementNamed(RecordsScreen.routeName);
        break;
      case 4:
        Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _onTap(index);
        },
      ),
    );
  }
}
