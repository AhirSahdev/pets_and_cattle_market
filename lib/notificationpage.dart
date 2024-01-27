import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Notification'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          children: <Widget>[
            // Replace with your notification widgets
            ListTile(
              title: const Text('Notification 1'),
              subtitle: const Text('Notification details'),
              onTap: () {
                // Handle notification tap
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Notification 2'),
              subtitle: const Text('More details'),
              onTap: () {
                // Handle notification tap
              },
            ),
            // Add more notifications as needed
          ],
        ),
      ),
    );
  }
}
