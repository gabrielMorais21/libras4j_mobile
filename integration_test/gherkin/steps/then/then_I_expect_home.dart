// ignore_for_file: file_names

import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import 'package:libras4j/presentation/pages/home/home_page.dart';

StepDefinitionGeneric thenIExpectHomeScreen() {
  return then<FlutterWorld>(
    'I expect the Home screen to be visible',
    (context) async {
      await context.world.appDriver.waitForAppToSettle();

      // Procurar pelo widget específico da tela de Home
      final homeFinder = context.world.appDriver.findBy(
        HomePage, // Assumindo que o texto ou identificador da tela de login é 'Home'
        FindType.type,
      );

      // Verificar se o widget da tela de Home está presente
      context.expect(homeFinder, findsOneWidget);
    },
    configuration: StepDefinitionConfiguration()
      ..timeout = const Duration(seconds: 5),
  );
}
