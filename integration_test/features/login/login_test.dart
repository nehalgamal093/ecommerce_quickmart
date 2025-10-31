import 'package:ecommerce_shop/features/auth/presentation/screen/import_files/import_files.dart';
import 'package:ecommerce_shop/features/auth/presentation/screen/login/login.dart';

import 'package:ecommerce_shop/main.dart' as app;

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../common_tests/login_method_test.dart';
import '../common_tests/onboarding_test.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Successful login", (tester) async {
    app.main();
    await tester.pumpAndSettle();
    //Two tabs on nextButton onboarding screen
    await onBoardingTest(tester);
    var loginButtonOnboarding = find.byKey(ValueKey('login_key_onboarding'));
    await tester.tap(loginButtonOnboarding);
    await tester.pumpAndSettle();
    expect(find.byType(LoginScreen), findsOneWidget);
    //enter email and password and tab login button
    await loginTest(tester);
    //wait logging to succeed using circular progress indicator
    await tester.pump(const Duration(seconds: 5));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    //when loading finish successfully MainScreen shows
    expect(find.byType(MainScreen), findsOneWidget);
  });
}
