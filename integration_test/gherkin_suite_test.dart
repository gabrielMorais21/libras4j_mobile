// ignore_for_file: avoid_print

import 'package:flutter_gherkin/flutter_gherkin.dart'; // notice new import name
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

// The application under test.
import 'package:libras4j/main.dart' as app;

import 'gherkin/steps/given/given_l_type_email.dart';
import 'gherkin/steps/given/given_l_type_password.dart';
import 'gherkin/steps/then/then_I_expect_home.dart';
import 'gherkin/steps/when/when_I_press.dart';

part 'gherkin_suite_test.g.dart';

@GherkinTestSuite()
void main() {
  executeTestSuite(
    configuration: FlutterTestConfiguration(
      stepDefinitions: [
        givenITypeTextEmail(),
        givenITypeTextPassword(),
        whenIPressButton(),
        thenIExpectHomeScreen(),
      ],
      order: ExecutionOrder.alphabetical,
      features: [RegExp('features/*.*.feature')],
      reporters: [
        StdoutReporter(MessageLevel.error)
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        ProgressReporter()
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        TestRunSummaryReporter()
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        JsonReporter(
          writeReport: (_, __) => Future<void>.value(),
        )
      ],
    ),
    appMainFunction: (World world) async => app.main(),
  );
}
