import 'package:dio/dio.dart';
import 'package:drinking_app/app/config/dio_exceptions.dart';
import 'package:drinking_app/app/core/utils/api_paths.dart';
import 'package:drinking_app/app/core/utils/debug_prints.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/data/models/product_model.dart';
import 'package:drinking_app/app/data/models/user_local_model.dart';
import 'package:drinking_app/app/data/services/apis/curd_api_helper.dart';
import 'package:drinking_app/app/data/services/local/user_info_local_Service.dart';
import 'package:drinking_app/app/domain/entities/product_entity.dart';
import 'package:drinking_app/app/domain/entities/user_local_entity.dart';

class ProductAPiServices {
  static ProductAPiServices? _productAPiServices;
  ProductAPiServices._internal();
  static ProductAPiServices instance() {
    if (_productAPiServices == null) {
      return _productAPiServices = ProductAPiServices._internal();
    }
    return _productAPiServices!;
  }

  Future<Map<String, dynamic>> createProductSer(ProductEntity entity) async {
    try {
      Map<String, dynamic> userInfo =
          UserInfoLocalService.instance().getUserInfo();
      printWarning("the user info is $userInfo");
      UserLocalEntity userData = UserLocalModel.fromJson(userInfo);
      printInfo("the user json is $userData");
      String userToken = userData.userToken!;
      Options options = Options(
          contentType: "multipart/form-data",
          headers: {"authorization": "Bearer $userToken"});
      Response response = await CurdApiHelper.instance.postRequest(
        path: CREATE_PRODUCT_REAUEST_PATH,
        data: ProductModel.toJson(entity),
        options: options,
      );
      printDone("the create product success => ${ProductModel.fromJson(
        response.data["product"],
      )}");
      return successRequest(
        responseBody: ProductModel.fromJson(
          response.data["product"],
        ),
      );
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("the create product error from dio catch => $message");
      return failedRequest(responseBody: message);
    } catch (e) {
      printError("the create product error from  catch => $e");
      return failedRequest(responseBody: e.toString());
    }
  }
}
