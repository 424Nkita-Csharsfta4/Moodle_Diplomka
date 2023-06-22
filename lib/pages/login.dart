import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_app/components/my_button.dart';
import 'package:my_app/components/my_textfield.dart';
import 'package:my_app/pages/signup.dart';
import 'home_page.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController passwordController = TextEditingController();

  final double _sigmaX = 5; // from 0-10
  final double _sigmaY = 5; // from 0-10
  final double _opacity = 0.2;
  final double _width = 350;
  final double _height = 300;
  final _formKey = GlobalKey<FormState>();

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final AccessToken accessToken = result.accessToken!;
      if (result.status == LoginStatus.success) {
        // Successfully signed in
        final userData = await FacebookAuth.instance.getUserData();
        print('Facebook login successful. User: $userData');
        // Navigate to the desired page
        // Navigator.push(context, MaterialPageRoute(builder: (context) => DesiredPage()));
      } else {
        // Error during Facebook login
        print('Facebook login failed. ${result.message}');
      }
    } catch (e) {
      print('Facebook login failed. $e');
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        // Use the `googleAuth` variable to authenticate with your backend server
        print('Google login successful. User: ${googleUser.displayName}');
        // Navigate to the desired page
        // Navigator.push(context, MaterialPageRoute(builder: (context) => DesiredPage()));
      } else {
        // Google login canceled
        print('Google login canceled.');
      }
    } catch (e) {
      print('Google login failed. $e');
    }
  }

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
                        "Вход",
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
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Form(
                              key: _formKey,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0,
                                      ),
                                      child: Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                              'https://sun9-57.userapi.com/impg/V4oJ_PMtThFABGcLBouxMlwAlwDSc3K7D0AyNw/IV96p5x-m-4.jpg?size=674x1199&quality=96&sign=788d921808290beac31c0e0bbd9d0af3&type=album',
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          ),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Никита Камень",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                "pochta@gmail.com",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
                                    MyButtonAgree(
                                      text: "Продолжить",
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const NewsFeedPage(),
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
                                          onTap: signInWithFacebook,
                                          child: Image.asset(
                                            'assets/images/facebook.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: signInWithGoogle,
                                          child: Image.asset(
                                            'assets/images/google.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SignupPage(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'У вас нет учетной записи? Зарегистрируйтесь',
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
