import 'package:drinking_app/app/config/internet_handling.dart';
import 'package:get/get.dart';

class InternetController extends GetxController {
  static InternetController? _internetController;
  InternetController._internal();
  static InternetController instance() {
    if (_internetController == null) {
      return _internetController = InternetController._internal();
    }
    return _internetController!;
  }

  String internetResult = '';
   checkInternetCon() {
    InternetHandling.instance().checkInsternetConnection();
  }
}
