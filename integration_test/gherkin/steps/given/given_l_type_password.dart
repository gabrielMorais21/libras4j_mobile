import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric givenITypeTextPassword() {
  return given1<String, FlutterWorld>(
    'que escrevo senha {string}',
    (value, context) async {
      final finder =
          context.world.appDriver.findBy('txtPassword', FindType.key);
      await context.world.appDriver.enterText(
        finder,
        value,
      );
    },
  );
}
