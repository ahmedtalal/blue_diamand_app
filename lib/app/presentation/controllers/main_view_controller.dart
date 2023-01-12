import 'package:drinking_app/app/presentation/views/cart_view.dart';
import 'package:drinking_app/app/presentation/views/home_view.dart';
import 'package:drinking_app/app/presentation/views/notification_view.dart';
import 'package:drinking_app/app/presentation/views/offers_view.dart';
import 'package:drinking_app/app/presentation/views/products_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainViewController extends GetxController{
  static final MainViewController _mainViewController = MainViewController._internal();
  MainViewController._internal();
  static MainViewController get instance => _mainViewController;
  var curvedCurrentIndex = 0.obs ;
  var curvedItems = <Widget>[
    const HomeView(),
    const ProductsView(),
    const OffersView(),
    const NotificationView(),
    const CartView(),
  ].obs;
   checkCurrentIndex(int index){
    curvedCurrentIndex.value = index;
  }
}