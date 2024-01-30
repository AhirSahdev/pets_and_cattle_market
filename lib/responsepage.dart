import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  const Response({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Response'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
      ),
      body: ListView(children: [
        Card(
          child: ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
            ),
            title: const Text('Name: Patel Rohit'),
            subtitle: const Text('Mobile No:-9510420330'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Call'),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
            ),
            title: const Text('Name: Tirthraj Vaghela'),
            subtitle: const Text('Mobile No:-9510440394'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Call'),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
            ),
            title: const Text('Name: Laxman Rabari'),
            subtitle: const Text('Mobile No:-9510445560'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Call'),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
            ),
            title: const Text('Name: Mohan Ahir'),
            subtitle: const Text('Mobile No:-9510420376'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Call'),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
            ),
            title: const Text('Name: Sahdev Goyal'),
            subtitle: const Text('Mobile No:-9510420334'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Call'),
            ),
          ),
        ),
      ]),
    );
  }
}
