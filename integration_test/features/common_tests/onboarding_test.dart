import 'package:ecommerce_shop/features/auth/presentation/screen/import_files/import_files.dart';
import 'package:ecommerce_shop/features/on_boarding/on_boarding.dart';
import 'package:flutter_test/flutter_test.dart';

Future onBoardingTest(WidgetTester tester)async{
  expect(find.byType(OnBoardingScreen), findsOneWidget);
  var nextButton = find.byKey(ValueKey('next_button'));
  await tester.tap(nextButton);
  await tester.pumpAndSettle();
  await tester.tap(nextButton);
  await tester.pumpAndSettle();
}