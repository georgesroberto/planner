import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:planner/providers/transaction_provider.dart';
import 'package:planner/providers/category_provider.dart';
import 'package:planner/providers/notification_provider.dart';
import 'package:planner/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        // Add other providers here
      ],
      child: MaterialApp(
        title: 'Finance App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
