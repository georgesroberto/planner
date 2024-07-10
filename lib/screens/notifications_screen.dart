import 'package:flutter/material.dart';
import 'package:planner/providers/notification_provider.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  static const String routeName = '/notifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        elevation: 0,
      ),
      body: Consumer<NotificationProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.notifications.length,
            itemBuilder: (context, index) {
              final notification = provider.notifications[index];
              return ListTile(
                title: Text(notification.title),
                subtitle: Text(notification.message),
                trailing: notification.isRead
                    ? null
                    : const Icon(Icons.notifications_active, color: Colors.red),
                onTap: () {
                  provider.markAsRead(notification.id!);
                },
              );
            },
          );
        },
      ),
    );
  }
}
