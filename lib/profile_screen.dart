import 'package:flutter/material.dart';
import 'user.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  final User user;

  const ProfileScreen({Key? key, required this.user, required String userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${user.name} ${user.surname}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
                radius: 80,
              ),
              const SizedBox(height: 20),
              Text(
                '${user.name} ${user.surname}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Email: ${user.email}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'Friends: ${user.friendsCount}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Actions when the button is pressed
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  primary: Colors.blue,
                ),
                child: const Text(
                  'Send Message',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.group,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Group Status: Group ${user.group}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.people,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Friends: ${user.friendsCount}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.follow_the_signs,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Followers: ${user.followersCount}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
