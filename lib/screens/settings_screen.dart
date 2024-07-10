import 'package:flutter/material.dart';
import 'package:planner/components/custom_bottom_nav_bar.dart';
import 'package:planner/screens/home_screen.dart';
import 'package:planner/screens/plan_details_screen.dart';
import 'package:planner/screens/records_screen.dart';
import 'package:planner/screens/transact_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const String routeName = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _currentIndex = 4;

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
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        break;
      case 3:
        Navigator.of(context).pushReplacementNamed(RecordsScreen.routeName);
        break;
      case 4:
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('Settings Screen'),
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
