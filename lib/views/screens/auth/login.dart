// ignore_for_file: unused_import, use_key_in_widget_constructors, library_private_types_in_public_api, avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app/util/extensions.dart';
import '../../../util/animations.dart';
import '../../../util/const.dart';
import '../../../util/enum.dart';
import '../../../util/router.dart';
import '../../widgets/custom_button.dart';
import 'package:my_app/views/widgets/custom_text_field.dart';
import '../main_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;
  bool validate = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String email, password, name = '';
  FocusNode nameFN = FocusNode();
  FocusNode emailFN = FocusNode();
  FocusNode passFN = FocusNode();
  FormMode formMode = FormMode.LOGIN;

  void login() async {
    FormState? form = formKey.currentState;
    form?.save();
    if (!form!.validate()) {
      setState(() {
        validate = true;
      });
      showInSnackBar(
          'Пожалуйста, исправьте ошибки, выделенные красным цветом, перед отправкой.');
    } else {
      Navigate.pushPageReplacement(context, MainScreen());
    }
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: Row(
          children: [
            buildLottieContainer(),
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    child: buildFormContainer(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLottieContainer() {
    final screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      width: screenWidth < 700 ? 0 : screenWidth * 0.5,
      duration: const Duration(milliseconds: 500),
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
      child: Center(
        child: Lottie.asset(
          AppAnimations.chatAnimation,
          height: 400,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildFormContainer() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          '${Constants.appName}',
          style: const TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ).fadeInList(0, false),
        const SizedBox(height: 70.0),
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: buildForm(),
        ),
        Visibility(
          visible: formMode == FormMode.LOGIN,
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      formMode = FormMode.FORGOT_PASSWORD;
                    });
                  },
                  child: const Text('Забыли пароль?'),
                ),
              ),
            ],
          ),
        ).fadeInList(3, false),
        const SizedBox(height: 20.0),
        buildButton(),
        Visibility(
          visible: formMode == FormMode.LOGIN,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('У вас нет аккаунта?'),
              TextButton(
                onPressed: () {
                  setState(() {
                    formMode = FormMode.REGISTER;
                  });
                },
                child: const Text('Регистрация'),
              ),
            ],
          ),
        ).fadeInList(5, false),
        Visibility(
          visible: formMode != FormMode.LOGIN,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('У вас уже есть аккаунт?'),
              TextButton(
                onPressed: () {
                  setState(() {
                    formMode = FormMode.LOGIN;
                  });
                },
                child: const Text('Вход'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (formMode == FormMode.REGISTER)
          Column(
            children: [
              TextFormField(
                enabled: !loading,
                decoration: const InputDecoration(
                  hintText: "Имя",
                ),
                textInputAction: TextInputAction.next,
                onChanged: (String? val) {
                  name = val ?? '';
                },
                focusNode: nameFN,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(emailFN);
                },
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        TextFormField(
          enabled: !loading,
          decoration: const InputDecoration(
            hintText: "Электронная почта",
          ),
          textInputAction: TextInputAction.next,
          onChanged: (String? val) {
            email = val ?? '';
          },
          focusNode: emailFN,
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(passFN);
          },
        ),
        if (formMode != FormMode.FORGOT_PASSWORD)
          Column(
            children: [
              const SizedBox(height: 20.0),
              TextFormField(
                enabled: !loading,
                decoration: const InputDecoration(
                  hintText: "Пароль",
                ),
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => login(),
                obscureText: true,
                onChanged: (String? val) {
                  password = val ?? '';
                },
                focusNode: passFN,
              ),
            ],
          ),
      ],
    );
  }

  Widget buildButton() {
    return loading
        ? const Center(child: CircularProgressIndicator())
        : CustomButton(
            label: "Отправить",
            onPressed: () => login(),
            color: const Color.fromARGB(255, 2, 1, 1),
          );
  }
}
