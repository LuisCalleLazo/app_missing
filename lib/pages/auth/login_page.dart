import 'package:app_missing/components/button/btn_text_dev.dart';
import 'package:app_missing/components/input/input_pass_dev.dart';
import 'package:app_missing/components/input/input_text_dev.dart';
import 'package:app_missing/components/text/text_title_dev.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  static String name = "login";
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(0, 0, 0, 1),
        child: Column(
          children: [
            const SizedBox(height: 70),

            // CUERPO DEL LOGIN
            Expanded(
              child: Container(
                color: const Color.fromRGBO(0, 0, 0, 0),
                child: Column(
                  children: [
                    // todo: INPUTS de LOGIN
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextTitleDev(
                            label: "LOGIN",
                            color: Colors.white,
                          ),

                          const SizedBox(height: 80),
                          const InputTextDev(
                            label: "Ingresar su nombre o correo",
                          ),
                          const SizedBox(height: 60),
                          const InputPassDev(),

                          const SizedBox(height: 120),
                          // todo: Boton de Login y de register
                          BtnTextDev(
                            text: "Iniciar Session",
                            onPressed: () {
                              context.push('/home');
                            },
                          ),
                          const SizedBox(height: 25),
                          BtnTextDev(
                            text: "Registrarme",
                            onPressed: () {
                              context.push('/auth/register');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
