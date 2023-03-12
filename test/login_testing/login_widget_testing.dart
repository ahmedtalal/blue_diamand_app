import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/core/utils/testing_keys.dart';
import 'package:drinking_app/app/core/utils/widgets/auth_links_shared_widget.dart';
import 'package:drinking_app/app/core/utils/widgets/text_icon_btn_shared_widget.dart';
import 'package:drinking_app/app/presentation/views/login_view.dart';
import 'package:drinking_app/app/presentation/widgets/auth_text_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

main() {
  group("widget testing for login screen", () {
    testWidgets("login widget testing", (tester) async {
      await tester.pumpWidget(const GetMaterialApp(
        home: LoginView(),
      ));

      final title = find.byKey(const ValueKey(TestingKeys.LOGIN_TITLE_KEY));
      expect(title, findsOneWidget);
      Text text = tester.firstWidget(title);
      expect(text.data, "BLUE DIAMOND");

      final descriptionTxt =
          find.byKey(const ValueKey(TestingKeys.LOGIN_DESCRIPTION_KEY));
      expect(descriptionTxt, findsOneWidget);
      Text descText = tester.firstWidget(descriptionTxt);
      expect(descText.data, description);

      final subTitle =
          find.byKey(const ValueKey(TestingKeys.LOGIN_SUBTITIE_KEY));
      expect(subTitle, findsOneWidget);
      Text subTitleText = tester.firstWidget(subTitle);
      expect(subTitleText.data, "Login account");

      final loginEmail =
          find.byKey(const ValueKey(TestingKeys.LOGIN_EMAIL_FIELD_KEY));
      await tester.enterText(loginEmail, "ahmedtalal@gmail.com");
      expect(find.text("ahmedtalal@gmail.com"), findsOneWidget);
      await tester.pumpAndSettle();

      final loginPassword =
          find.byKey(const ValueKey(TestingKeys.LOGIN_PASSWORD_FIELD_KEY));
      await tester.enterText(loginPassword, "Closebook12@");
      expect(find.text("Closebook12@"), findsOneWidget);
      await tester.pumpAndSettle();

      final forgetPassword =
          find.byKey(const ValueKey(TestingKeys.LOGIN_FORGETPASSWORD_BTN_KEY));
      await tester.ensureVisible(forgetPassword);
      await tester.tap(forgetPassword);
      await tester.pumpAndSettle();

      final loginBtn = find.byKey(const ValueKey(TestingKeys.LOGIN_BTN_KEY));
      await tester.tap(loginBtn);
      await tester.pumpAndSettle();
      final loginFinder =
          tester.firstWidget(loginBtn) as TextIconBtnSharedWidget;
      expect(loginFinder.btnColor, AppColor.color2);

      final registerLink =
          find.byKey(const ValueKey(TestingKeys.LOGIN_REGISTER_LINK_BTN_KEY));
      await tester.tap(registerLink);
      await tester.pumpAndSettle();
      final registerFinder =
          tester.firstWidget(registerLink) as AuthLinksSharedWidget;
      expect(registerFinder.textLink, "register");

      final anotherLoginTxt =
          find.byKey(const ValueKey(TestingKeys.LOGIN_ANOTHER_LOGIN_KEY));
      expect(anotherLoginTxt, findsOneWidget);
      final anotherFinder = tester.firstWidget(anotherLoginTxt) as Text;
      expect(anotherFinder.data, "Or login with");

      final phoneBtn =
          find.byKey(const ValueKey(TestingKeys.LOGIN_USING_PHONE_NUMBER_KEY));
      await tester.tap(phoneBtn);
      await tester.pumpAndSettle();
      final phoneNumberFinder =
          tester.firstWidget(phoneBtn) as AuthTextIconBtnWidget;
      expect(phoneNumberFinder.btnTitle, "Phone Number");

      final googleBtn =
          find.byKey(const ValueKey(TestingKeys.LOGIN_USING_GOOGLE_KEY));
      await tester.tap(googleBtn);
      await tester.pumpAndSettle();
      final googleBtnFinder =
          tester.firstWidget(googleBtn) as AuthTextIconBtnWidget;
      expect(googleBtnFinder.btnTitle, "Google");
    });
  });
}
