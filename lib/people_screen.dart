import 'package:flutter/material.dart';
import 'user.dart';
import 'profile_screen.dart';

class PeopleScreen extends StatelessWidget {
  //const PeopleScreen({Key? key}) : super(key: key);

  // Список пользователей
  final List<User> users = [
    User(
      name: 'John',
      surname: 'Doe',
      avatar: 'https://example.com/avatar1.jpg',
      email: 'johndoe@example.com',
      friendsCount: 10,
      group: 'A',
    ),
    User(
      name: 'Jane',
      surname: 'Smith',
      avatar: 'https://example.com/avatar2.jpg',
      email: 'janesmith@example.com',
      friendsCount: 5,
      group: 'B',
    ),
    // Добавьте других пользователей в список
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People Screen'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
            ),
            title: Text('${user.name} ${user.surname}'),
            subtitle: Text('Group: ${user.group}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    // Обработчик нажатия кнопки "Добавить в друзья"
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Добавление в друзья'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(user.avatar),
                                radius: 40,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Вы добавили ${user.name} ${user.surname} в друзья.',
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.person_add),
                ),
                IconButton(
                  onPressed: () {
                    // Обработчик нажатия кнопки "Написать"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(user: user),
                      ),
                    );
                  },
                  icon: const Icon(Icons.message),
                ),
              ],
            ),
            onTap: () {
              // Обработчик нажатия на элемент списка
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    user: user,
                    userId: '',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final User user;

  const ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.name} ${user.surname}'),
      ),
      body: Center(
        child: Text('Chat with ${user.name} ${user.surname}'),
      ),
    );
  }
}
