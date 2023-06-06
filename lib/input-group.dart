// ignore: file_names
import 'package:flutter/material.dart';
import 'package:my_app/registration_screen.dart';
import 'main_ribbon.dart';

class GroupSelectionScreen extends StatefulWidget {
  const GroupSelectionScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GroupSelectionScreenState createState() => _GroupSelectionScreenState();
}

class _GroupSelectionScreenState extends State<GroupSelectionScreen> {
  final TextEditingController _groupController = TextEditingController();
  String? _errorMessage;

  get user => null;

  @override
  void dispose() {
    _groupController.dispose();
    super.dispose();
  }

  void _validateGroup() {
    setState(() {
      final group = _groupController.text;
      if (group.isEmpty || !isValidGroup(group)) {
        _errorMessage = 'Введите существующую группу';
      } else {
        _errorMessage = null;
        // Navigate to the desired screen here
        // Replace NextScreen with the actual screen you want to navigate to
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InputGroupNextScreen(user: user!),
          ),
        );
      }
    });
  }

  bool isValidGroup(String group) {
    // Validation logic for the group
    // Implement your validation logic here
    // Return true if the group exists, false otherwise
    return group == '111' || group == '112' || group == '113';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите номер группы'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Выберите номер группы в которой вы учитесь.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _groupController,
              decoration: InputDecoration(
                labelText: 'Номер группы',
                errorText: _errorMessage,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validateGroup,
              child: const Text('Начать'),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder screen
class NextScreen extends StatelessWidget {
  const NextScreen({super.key, required User user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Screen'),
      ),
      body: const Center(
        child: Text('This is the next screen.'),
      ),
    );
  }
}
