import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_app/components/my_button.dart';
import 'package:my_app/components/my_textfield.dart';
import 'package:my_app/pages/login.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController groupController = TextEditingController();

  final double _sigmaX = 5; // from 0-10
  final double _sigmaY = 5; // from 0-10
  final double _opacity = 0.2;
  final _formKey = GlobalKey<FormState>();

  void signUserIn() {
    if (_formKey.currentState!.validate()) {
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(191, 142, 247, 146),
              Color.fromARGB(255, 182, 174, 255),
              Color.fromARGB(255, 233, 224, 139),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 400,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.26,
                      ),
                      const Text(
                        "Регистрация",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: _sigmaX,
                            sigmaY: _sigmaY,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 0, 0, 1)
                                  .withOpacity(_opacity),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                            ),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: Form(
                              key: _formKey,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/default_avatar.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: () {
                                        // Add logic to select and set the avatar image
                                      },
                                      child: const Text(
                                        'Выбрать аватар',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    MyTextField(
                                      controller: usernameController,
                                      hintText: 'Имя',
                                      obscureText: false,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    MyTextField(
                                      controller: passwordController,
                                      hintText: 'Пароль',
                                      obscureText: true,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    MyTextField(
                                      controller: groupController,
                                      hintText: 'Группа',
                                      obscureText: false,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    MyButtonAgree(
                                      text: "Регистрация",
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginPage(),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            print("Facebook signup");
                                          },
                                          child: Image.asset(
                                            'assets/images/facebook.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                            print("Google signup");
                                          },
                                          child: Image.asset(
                                            'assets/images/google.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                            print("Apple signup");
                                          },
                                          child: Image.asset(
                                            'assets/images/apple.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginPage(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'У вас уже есть учетная запись? Войдите',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 225, 255, 73),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.start,
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
      ),
    );
  }
}
