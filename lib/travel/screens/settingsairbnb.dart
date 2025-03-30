import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile Management'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Profile Management
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Notifications
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacy & Security'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Privacy & Security
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Help & Support
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Us'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to About Us
            },
          ),
          const Divider(),
          // ListTile(
          //   leading: const Icon(Icons.logout, color: Colors.red),
          //   title: const Text('Logout', style: TextStyle(color: Colors.red)),
          //   onTap: () {
          //     // Implement Logout functionality
          //   },
          // ),
        ],
      ),
    );
  }
}
