import 'package:drinking_app/app/presentation/views/register_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

main(){
  group("widget testing for register screen", () {
    testWidgets("register widget testing", (tester)async{
      await tester.pumpWidget(const GetMaterialApp(
        home: RegisterView(),
      ));


    });
  });
}