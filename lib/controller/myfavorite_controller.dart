import 'package:ecomerce1/core/class/statusrequest.dart';
import 'package:ecomerce1/core/functions/handlingdatacontroller.dart';
import 'package:ecomerce1/core/services/services.dart';
import 'package:ecomerce1/data/datasource/remote/myfavorite.dart';
import 'package:ecomerce1/data/model/myFavorite.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  MyServices myServices = Get.find();
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(String favoriteid) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    // ignore: unused_local_variable
    var response = favoriteData.deleteData(favoriteid);
    // ignore: unrelated_type_equality_checks
    data.removeWhere((element) => element.favoriteId.toString()  == favoriteid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
// deleteFromFavorite(String favoriteid)  {
//     var response =  favoriteData.deleteData(favoriteid);
//     data.removeWhere((element) => element.favoriteId == favoriteid);
//     update();
//   }