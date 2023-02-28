const String drinkImg = "assets/images/drinkimage.png";
const String appFont = "Sofia";
const String diamondImg = "assets/images/diamond.png";
const String description =
    "Blue Diamand water for your daily mineral water,you are just one click away from your blue diamand water of your door step";
const String phoneImg = "assets/images/phonecall.png";
const String googleImg = "assets/images/google.png";
const String mapKey = "key";
const String mapvalue = "value";
const String successMapkey = "success";
const String failedMapKey = "failed";
const String userNotFound = "user not found in local storage";

Map<String, dynamic> successRequest({required var responseBody}) {
  return {
    mapKey: successMapkey,
    mapvalue: responseBody,
  };
}

Map<String, dynamic> failedRequest({required var responseBody}) {
  return {
    mapKey: failedMapKey,
    mapvalue: responseBody,
  };
}

const String homeImg = "assets/images/home.png";
const String productsImg = "assets/images/product.png";
const String offersImg = "assets/images/offer.png";
const String cartImg = "assets/images/cart.png";
const String notificationImg = "assets/images/notification.png";
const String userImg = "assets/images/user.png";
const String locationImg = "assets/images/location.png";
const String waterImg = "assets/images/waterimage.jpeg";
const String profleImg = "assets/images/profilebacground.jpeg";
const String notiBackground = "assets/images/notificationbackground.png";
const String cameraBtn = "assets/images/camera.png";
