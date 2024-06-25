import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libras4j/bloc/auth/auth_state.dart';
import 'package:libras4j/bloc/create_account/create_account_cubit.dart';
import 'package:libras4j/bloc/create_account/create_account_state.dart';
import 'package:libras4j/consts/colors.dart';
import 'package:libras4j/consts/styles.dart';
import 'package:libras4j/data/mappers/create_account_request.dart';
import 'package:libras4j/locator.dart' as locator;
import 'package:libras4j/presentation/pages/login/login_page.dart';

class RegisterPage extends StatefulWidget {
  final CreateAccountCubit createAccountCubit;
  const RegisterPage({super.key, required this.createAccountCubit});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

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
              controller: _nameController,
              decoration: const InputDecoration(
                  labelText: 'Nome:', labelStyle: AppStyles.bodySmallBold),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: 'Email:', labelStyle: AppStyles.bodySmallBold),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  labelText: 'Senha:', labelStyle: AppStyles.bodySmallBold),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: BlocConsumer<CreateAccountCubit, CreateAccountState>(
                listener: (context, state) async {
                  if (state is CreateAccountSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen(
                                authCubit: locator.getIt(),
                              )),
                    );
                  }
                },
                bloc: widget.createAccountCubit,
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary500, // Cor de fundo
                      foregroundColor: Colors.white, // Cor do texto
                    ),
                    onPressed: () {
                      final name = _nameController.text;
                      final email = _emailController.text;
                      final password = _passwordController.text;

                      widget.createAccountCubit.createAccount(
                          createAccountRequest: CreateAccountRequest(
                              name: name,
                              email: email,
                              password: password,
                              roles: [
                            Roles(id: 1, roleName: "ROLE_OPERATOR"),
                            Roles(id: 2, roleName: "ROLE_ADMIN")
                          ]));
                    },
                    child: state is CreateAccountLoading
                        ? const SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Criar conta',
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
                    MaterialPageRoute(
                        builder: (context) => LoginScreen(
                              authCubit: locator.getIt(),
                            )),
                  );
                },
                child: Text(
                  'Já possui uma conta, fazer login!',
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
