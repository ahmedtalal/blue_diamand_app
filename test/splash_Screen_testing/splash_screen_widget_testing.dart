import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/core/utils/testing_keys.dart';
import 'package:drinking_app/app/presentation/views/splash_screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

main(){
  group("widget testing for splash screen", () {
    testWidgets("splash screen widget testing", (tester)async{
      await tester.pumpWidget(
        const GetMaterialApp(
          home:  SplashScreenView(),
        ),
      );

      final image  = find.byKey(const ValueKey(TestingKeys.SPLASH_IMAGE_KEY));
      expect(find.image(const AssetImage(drinkImg)), findsOneWidget);
      
      final titleFinder = find.byKey(const ValueKey(TestingKeys.SPLASH_TITLE_KEY));
      expect(titleFinder, findsOneWidget);
      Text title = tester.firstWidget(titleFinder);
      expect(title.data, "BLUE DIAMOND");

      final descriptionFinder = find.byKey(const ValueKey(TestingKeys.SPLASH_DESCRIPTION_KEY));
      expect(descriptionFinder, findsOneWidget);
      Text descriptionChecker = tester.firstWidget(descriptionFinder);
      expect(descriptionChecker.data, description);

      final getStartedBtn = find.byKey(const ValueKey(TestingKeys.SPLASH_GET_STARTED_BTN_KEY));
      await tester.tap(getStartedBtn);
      await tester.pumpAndSettle();
      expect(find.text("Get started"), findsOneWidget);
    });
  });
}