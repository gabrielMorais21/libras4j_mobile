import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libras4j/bloc/auth/auth_cubit.dart';
import 'package:libras4j/bloc/auth/auth_state.dart';
import 'package:libras4j/consts/colors.dart';
import 'package:libras4j/consts/styles.dart';
import 'package:libras4j/data/mappers/login_request.dart';

import 'package:libras4j/locator.dart';
import 'package:libras4j/presentation/pages/home/home_page.dart';
import 'package:libras4j/presentation/pages/register/register_page.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/surdez.png',
              width: 100,
              height: 100,
            ),
            TextField(
              key: const Key('txtEmail'),
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: 'Email', labelStyle: AppStyles.bodySmallBold),
            ),
            TextField(
              key: const Key('txtPassword'),
              controller: _passwordController,
              decoration: const InputDecoration(
                  labelText: 'Password', labelStyle: AppStyles.bodySmallBold),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: AppColors.primary500,
                  value: true,
                  onChanged: (value) {},
                ),
                const Text(
                  "Lembrar senha",
                  style: AppStyles.bodyLargeSemiBold,
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: BlocConsumer<AuthCubit, AuthState>(
                bloc: getIt<AuthCubit>(),
                listener: (context, state) async {
                  if (state is AuthSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    key: const Key('btnLogin'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary500, // Cor de fundo
                      foregroundColor: Colors.white, // Cor do texto
                    ),
                    onPressed: () {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      getIt<AuthCubit>().login(
                          loginRequest: LoginRequest(
                              email: email,
                              password: password,
                              grantType: "password"));
                    },
                    child: state is AuthLoading
                        ? const SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Login',
                            style: AppStyles.bodySmallBold
                                .merge(const TextStyle(color: Colors.white)),
                          ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Cor de fundo
                  foregroundColor: AppColors.primary500, // Cor do texto
                  side: const BorderSide(color: AppColors.primary500, width: 3),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text(
                  'Criar conta',
                  style: AppStyles.bodySmallBold
                      .merge(const TextStyle(color: AppColors.primary500)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
