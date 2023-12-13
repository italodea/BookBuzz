// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:bookbuzz/data/repositories/users_api.dart';
import 'package:bookbuzz/general_components/my_message.dart';
import 'package:bookbuzz/pages/Login/components/my_input_field.dart';
import 'package:bookbuzz/pages/Login/components/my_input_password.dart';
import 'package:bookbuzz/routes/app_routes.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../../styles/app_buttons.dart';
import '../../styles/app_text.dart';
import 'components/logo_stack.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _urlPhotoController = TextEditingController();

  bool isLoading = false;

  void _handleRegister() async {
    setState(() {
      isLoading = true;
    });

    if (_formKey.currentState?.validate() ?? false) {
      _urlPhotoController.text = "";
      try {
        await UsersApi.create(
          email: _emailController.text,
          name: _nameController.text,
          password: _passwordController.text,
          url_photo: _urlPhotoController.text,
        );
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoute.LOGIN,
          (route) => route.settings.name == AppRoute.WELCOME,
        );
        AppMessenger.showMessageGreen(
          context,
          'Cadastro realizado com sucesso!',
        );
      } catch (error) {
        print("Error occurred during registration: $error");
        AppMessenger.showMessageRed(
          context,
          'Falha ao fazer cadastro!',
        );
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Criar conta",
          style: AppText.displayLarge.merge(AppText.blackColor),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyInputField(
                        controller: _nameController,
                        label: "Nome",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira um nome válido!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyInputField(
                        controller: _emailController,
                        label: "Email",
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@')) {
                            return 'Por favor, insira um email válido!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyInputPassword(
                        controller: _passwordController,
                        label: "Senha",
                        obscure: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira uma senha válida!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyInputPassword(
                        controller: _confirmPasswordController,
                        label: "Confirmar Senha",
                        obscure: true,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value != _passwordController.text) {
                            return 'As senhas preenchidas não coincidem!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      ElevatedButton(
                        style: AppButtons.myButton,
                        onPressed: isLoading ? null : _handleRegister,
                        child: isLoading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: AppColors.blackColor,
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "Cadastrar",
                                  style: AppText.displaySmall.merge(
                                    AppText.blackColor,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
