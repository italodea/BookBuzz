// ignore_for_file: prefer_const_constructors, constant_identifier_names, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:bookbuzz/general_components/my_message.dart';
import 'package:bookbuzz/pages/Login/components/my_input_password.dart';
import 'package:flutter/material.dart';
import 'package:bookbuzz/pages/Login/components/my_input_field.dart';
import 'package:bookbuzz/services/auth_service.dart';
import 'package:bookbuzz/routes/app_routes.dart';
import 'package:bookbuzz/styles/app_buttons.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool loading = false;
  bool isFirstLoad = false;

  @override
  void initState() {
    super.initState();
    //_checkSessionAndNavigate();
  }

  Future<void> _checkSessionAndNavigate() async {
    bool isValidSession = await AuthService().isValidSession();
    if (isValidSession && mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoute.HOME,
        (route) => false,
      );
    }
    setState(() {
      isFirstLoad = false;
    });
  }

  void _handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        loading = true;
      });

      bool loginSuccess = await AuthService()
          .login(_emailController.text, _passController.text);

      setState(() {
        loading = false;
      });

      if (loginSuccess && mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoute.HOME, (route) => false);
      } else if (mounted) {
        AppMessenger.showMessageRed(
          context,
          'Falha ao fazer login. Verifique suas credenciais.',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Visibility(
          visible: !loading,
          child: Text(
            "Bem-Vindo de volta!",
            style: AppText.displayLarge.merge(AppText.blackColor),
            textAlign: TextAlign.center,
          ),
        ),
        leading: Visibility(
          visible: !loading,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: AnimatedCrossFade(
        crossFadeState:
            (loading) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Duration(
          milliseconds: 3,
        ),
        firstChild: isFirstLoad
            ? Container()
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/images/component2.png',
                          height: 250,
                          width: 250,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: 250,
                          width: 250,
                          child:
                              Image.asset('assets/animations/animation1.gif'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Text(
                      "Carregando...",
                      style:
                          AppText.displayMedium.merge(AppText.secondaryColor),
                    ),
                  ],
                ),
              ),
        secondChild: isFirstLoad
            ? Container()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 20, right: 20, bottom: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Por favor, faça login para continuar.",
                                  style: AppText.bodyMedium
                                      .merge(AppText.blackColor),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                MyInputField(
                                  label: "Email",
                                  controller: _emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor, insira um email válido!';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                MyInputPassword(
                                  label: "Senha",
                                  obscure: true,
                                  controller: _passController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor, insira sua senha!';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Esqueceu a senha?",
                                  style: AppText.headlineSmall
                                      .merge(AppText.blackColor),
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                ElevatedButton(
                                  style: AppButtons.myButton,
                                  onPressed: _handleLogin,
                                  child: Text(
                                    "Entrar",
                                    style: AppText.displaySmall
                                        .merge(AppText.blackColor),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                ),
                                InkWell(
                                  onTap: () {
                                    _emailController.clear();
                                    _passController.clear();
                                    Navigator.pushNamed(
                                        context, AppRoute.SIGNUP);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Não tem uma conta? ",
                                        style: AppText.bodyMedium
                                            .merge(AppText.blackColor),
                                      ),
                                      Text(
                                        "Criar conta",
                                        style: AppText.headlineSmall
                                            .merge(AppText.blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                                // ESTILO
                                Container(
                                  width: double.infinity,
                                  height: 3,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(0x00c4c4c4),
                                        Color(0xffffc700),
                                        Color(0xffffc700),
                                        Color(0x00c4c4c4),
                                      ],
                                      stops: [0.0, 0.3, 0.7, 1.0],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      tileMode: TileMode.clamp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
