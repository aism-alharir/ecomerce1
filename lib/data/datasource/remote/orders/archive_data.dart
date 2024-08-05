import 'package:ecomerce1/core/class/crud.dart';
import 'package:ecomerce1/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.archiveorders, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  rating(String orderid, String rating, String comment) async {
    var response = await crud.postData(AppLink.rating,
        {"orderid": orderid, "rating": rating, "comment": comment});
    return response.fold((l) => l, (r) => r);
  }
}
