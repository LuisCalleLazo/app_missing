import 'package:app_missing/presentation/provider/auth/auth_provider.dart';
import 'package:app_missing/presentation/widgets/button/btn_text_dev.dart';
import 'package:app_missing/presentation/widgets/input/input_pass_dev.dart';
import 'package:app_missing/presentation/widgets/input/input_text_dev.dart';
import 'package:app_missing/presentation/widgets/text/text_title_dev.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static String name = "login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          const Expanded(
            child: TextTitleDev(
              label: "LOGIN",
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 120),
          Expanded(
            child: Column(
              children: [
                InputTextDev(
                  controller: emailController,
                  label: "Ingresar su nombre o correo",
                ),
                const SizedBox(height: 60),
                InputPassDev(
                  controller: passwordController,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 120),
                // todo: Boton de Login y de register
                BtnTextDev(
                  text: "Iniciar Session",
                  onPressed: () async {
                    final authContext = Provider.of<AuthProvider>(
                      context,
                      listen: false,
                    );
                    await authContext.login(
                      emailController.text,
                      passwordController.text,
                      context,
                    );
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
    );
  }
}
