import 'package:flutter/material.dart';
import 'package:planner/components/custom_bottom_nav_bar.dart';
import 'package:planner/screens/home_screen.dart';
import 'package:planner/screens/records_screen.dart';
import 'package:planner/screens/settings_screen.dart';
import 'package:planner/screens/transact_screen.dart';

class PlanDetailsScreen extends StatefulWidget {
  const PlanDetailsScreen({super.key});
  static const String routeName = '/plan';

  @override
  State<PlanDetailsScreen> createState() => _PlanDetailsScreenState();
}

class _PlanDetailsScreenState extends State<PlanDetailsScreen> {
  int _currentIndex = 1;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (_currentIndex) {
      case 0:
        Navigator.of(context).pushReplacementNamed(TransactScreen.routeName);
        break;
      case 1:
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
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
        title: const Text('Plan Details'),
      ),
      body: const Center(
        child: Text('Plan Details Screen'),
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
