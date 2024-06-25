import 'package:flutter/material.dart';
import 'package:libras4j/consts/colors.dart';
import 'package:libras4j/presentation/pages/login/login_page.dart';
import 'locator.dart' as locator;

void main() {
  locator.setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppColors
                    .primary500), // Cor do sublinhado quando habilitado
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.primary500), // Cor do sublinhado quando focado
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.primary500), // Cor do sublinhado padrão
          ),
        ),
      ),
      title: 'Flutter Demo',
      home: LoginScreen(authCubit: locator.getIt()),
    );
  }
}
