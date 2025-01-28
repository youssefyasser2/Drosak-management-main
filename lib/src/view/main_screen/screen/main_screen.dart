import 'package:drosak/src/core/resources/routes_mananger.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, RoutesName.kLoginScreenRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Welcome to Your App!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Subtitle
            const Text(
              'Here are some quick actions for you:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),

            // Action Cards
            Expanded(
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: const Text('Profile'),
                      subtitle: const Text('View and edit your profile'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Handle navigation
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      subtitle: const Text('Manage app settings'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Handle navigation
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.notifications),
                      title: const Text('Notifications'),
                      subtitle: const Text('View recent notifications'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Handle navigation
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.kRegisterScreenRoute);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
