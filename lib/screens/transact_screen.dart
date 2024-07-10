import 'package:flutter/material.dart';
import 'package:planner/components/custom_bottom_nav_bar.dart';
import 'package:planner/screens/home_screen.dart';
import 'package:planner/screens/plan_details_screen.dart';
import 'package:planner/screens/records_screen.dart';
import 'package:planner/screens/settings_screen.dart';

class TransactScreen extends StatefulWidget {
  const TransactScreen({super.key});
  static const String routeName = '/transact';

  @override
  State<TransactScreen> createState() => _TransactScreenState();
}

class _TransactScreenState extends State<TransactScreen> {
  int _currentIndex = 3;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (_currentIndex) {
      case 0:
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
        title: const Text('Transact'),
        elevation: 0,
      ),
      body: const Center(
        child: Text('Transact Screen'),
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
