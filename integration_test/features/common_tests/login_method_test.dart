import 'package:ecommerce_shop/features/auth/presentation/screen/import_files/import_files.dart';
import 'package:ecommerce_shop/features/auth/presentation/screen/login/login.dart';
import 'package:flutter_test/flutter_test.dart';

Future loginTest(WidgetTester tester)async{
  //enter email in field
  var emailField = find.byKey(ValueKey('email_field'));
  await tester.enterText(emailField, "n@gmail.com");
  await tester.pump();
  //enter password in field
  var passwordField = find.byKey(ValueKey("password_field"));
  await tester.enterText(passwordField, "nehal123456\$N");
  await tester.pumpAndSettle();
  //validate using provider
  final validationProvider =
  tester.element(find.byType(LoginScreen)).read<ValidateProvider>();
  validationProvider.isValid = true;
  validationProvider.notifyListeners();
  //tab on login button
  await tester.pumpAndSettle();
  var loginButton = find.byKey(ValueKey("login_button"));
  await tester.tap(loginButton);
}