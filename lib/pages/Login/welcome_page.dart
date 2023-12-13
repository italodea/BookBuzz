// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:bookbuzz/routes/app_routes.dart';
import 'package:bookbuzz/services/auth_service.dart';
import 'package:bookbuzz/styles/app_buttons.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isFirstLoad = true;

  @override
  void initState() {
    super.initState();
    _checkSessionAndNavigate();
  }

  // BIOMETRIA
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<void> _authenticateWithBiometrics() async {
    bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
    List<BiometricType> availableBiometrics =
        await _localAuth.getAvailableBiometrics();

    if (!canCheckBiometrics || availableBiometrics.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Biometria não disponível ou não configurada neste dispositivo.',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    _performAuthentication();
  }

  Future<void> _performAuthentication() async {
    bool didAuthenticate = false;

    try {
      didAuthenticate = await _localAuth.authenticate(
          localizedReason: 'Por favor, autentique-se para fazer login',
          options: const AuthenticationOptions(biometricOnly: true)
          //biometricOnly: true,
          );
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Erro de autenticação: ${e.message}',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (didAuthenticate && mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoute.HOME,
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Falha na autenticação biométrica',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _checkSessionAndNavigate() async {
    bool isValidSession = await AuthService().isValidSession();
    if (isValidSession) {
      _authenticateWithBiometrics();
    }

    // if (isValidSession && mounted) {
    //   Navigator.pushNamedAndRemoveUntil(
    //     context,
    //     AppRoute.HOME,
    //     (route) => false,
    //   );
    // }
    setState(() {
      isFirstLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: AnimatedCrossFade(
          crossFadeState: (isFirstLoad)
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
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
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFFFFC700),
                          ),
                          height: 430,
                          width: 400,
                          child: Stack(
                            children: [
                              Positioned(
                                height: 160,
                                top: 50,
                                left: 200,
                                width: MediaQuery.of(context).size.width,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Transform(
                                    transform: Matrix4.identity()
                                      ..scale(-1.0, 1.0),
                                    child:
                                        Image.asset('assets/images/cloud.png'),
                                  ),
                                ),
                              ),
                              Positioned(
                                height: 160,
                                top: 260,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Image.asset('assets/images/cloud.png'),
                                ),
                              ),
                              Center(
                                child: Image.asset(
                                  'assets/logo/logo-transparent.png',
                                  height: 300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "BookBuzz",
                          style: AppText.displayLarge,
                        ),
                        Text(
                          "Bem-vindo ao BookBuzz, o aplicativo que vai te ajudar a organizar seus livros e clubes de leitura!",
                          textAlign: TextAlign.center,
                          style: AppText.bodyLarge.merge(AppText.blackColor),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                        ),
                        // BOTOES
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                style: AppButtons.loginButton.merge(
                                  ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Entrar',
                                  style: AppText.displaySmall
                                      .merge(AppText.blackColor),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/signup');
                                },
                                style: AppButtons.registerButton.merge(
                                  ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Registrar',
                                  style: AppText.displaySmall
                                      .merge(AppText.greyColor),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
        ));
  }
}
