import 'package:flutter/material.dart';
import 'package:planner/components/custom_bottom_nav_bar.dart';
import 'package:planner/screens/home_screen.dart';
import 'package:planner/screens/plan_details_screen.dart';
import 'package:planner/screens/settings_screen.dart';
import 'package:planner/screens/transact_screen.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});
  static const String routeName = '/records';

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  int _currentIndex = 3;

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
        title: const Text('Records'),
      ),
      body: const Center(
        child: Text('Records Screen'),
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
