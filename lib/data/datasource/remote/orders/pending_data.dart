import 'package:ecomerce1/core/class/crud.dart';
import 'package:ecomerce1/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.pendingorders, {
      "id" : userid
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String orderid) async {
    var response = await crud.postData(AppLink.ordersdelete, {
      "orderid" : orderid.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
