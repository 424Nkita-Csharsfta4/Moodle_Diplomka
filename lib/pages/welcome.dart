// ignore_for_file: unused_field, sized_box_for_whitespace

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_app/components/my_button.dart';
import 'package:my_app/components/my_textfield.dart';
import 'package:my_app/components/square_tile.dart';
import 'package:my_app/pages/signup.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final double _sigmaX = 5; // from 0-10
  final double _sigmaY = 5; // from 0-10
  final double _opacity = 0.2;
  final double _width = 350;
  final double _height = 300;
  final _formKey = GlobalKey<FormState>();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  'https://sun9-80.userapi.com/impg/6W4eWW9Z19DV5LMQbutS6XzzAUtkXT4z4c8QFg/4kvAliS_Xyg.jpg?size=750x750&quality=95&sign=99200d2d302ee66a048d5e81bb9e7214&type=album',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                    const Text(
                      "Приветствуем!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ClipRect(
                      child: BackdropFilter(
                        filter:
                            ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 0, 0, 1)
                                .withOpacity(_opacity),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.63,
                          child: Form(
                            key: _formKey,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyTextField(
                                    controller: usernameController,
                                    hintText: 'Почта',
                                    obscureText: false,
                                  ),
                                  const SizedBox(height: 10),
                                  MyButton(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignupPage()),
                                        );
                                      } else {
                                        // ignore: avoid_print
                                        print('not valid');
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          thickness: 0.5,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text(
                                          'Или',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          thickness: 0.5,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SquareTile(
                                          imagePath:
                                              'assets/images/facebook.png',
                                          title: "Continue with Facebook",
                                        ),
                                        SizedBox(height: 10),
                                        SquareTile(
                                          imagePath: 'assets/images/google.png',
                                          title: "Continue with Google",
                                        ),
                                        SizedBox(height: 10),
                                        SquareTile(
                                          imagePath: 'assets/images/apple.png',
                                          title: "Continue with Apple",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'У вас нет аккаунта?',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              'Регистрация',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    183, 79, 218, 132),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        const Text(
                                          'Забыли пароль?',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 250, 255, 103),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
