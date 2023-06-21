import 'package:flutter/material.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.network(
                  'https://sun9-26.userapi.com/impg/BcM9ZJnyLKJi0UktgxUL7h8CkA2ST267KkQqKA/28lOIrfjYRU.jpg?size=224x54&quality=96&sign=f1983bbc9e9ee561cb728867db89e1f6&type=album',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use
                      primary: Colors.white,
                      // ignore: deprecated_member_use
                      onPrimary: Colors.black,
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text('Вход'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use
                      primary: const Color(0xFF4C6ED7),
                      // ignore: deprecated_member_use
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    child: const Text('Регистрация'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainRibbon(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
// Add your content here
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MainRibbon extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Image.network(
        'https://sun9-26.userapi.com/impg/BcM9ZJnyLKJi0UktgxUL7h8CkA2ST267KkQqKA/28lOIrfjYRU.jpg?size=224x54&quality=96&sign=f1983bbc9e9ee561cb728867db89e1f6&type=album',
        width: 150,
      ),
    );
  }
}
